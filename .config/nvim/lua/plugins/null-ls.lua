local function is_root(path)
  return path == "/"
end

local function is_exists_rubocop_yml(path)
  if is_root(path) then
    return vim.fn.filereadable("/.rubocop.yml") == 1
  else
    return vim.fn.filereadable(path .. "/.rubocop.yml") == 1
  end
end

local function is_exists_gemfile(path)
  if is_root(path) then
    return vim.fn.filereadable("/Gemfile") == 1
  else
    return vim.fn.filereadable(path .. "/Gemfile") == 1
  end
end

local function should_use_bundler(path)
  local current_path = require("plenary.path"):new(path)

  -- rootディレクトリで bundler を使うケースは考えにくいためskip
  if is_root(tostring(current_path)) then
    return false
  end

  local ancestor_paths = vim.list_extend({ tostring(current_path) }, current_path:parents())
  for _, a_path in pairs(ancestor_paths) do
    if is_exists_gemfile(a_path) and is_exists_rubocop_yml(a_path) then
      return true
    end
  end

  return false
end

local null_ls_util = require("null-ls.utils")
local null_ls = require("null-ls")
null_ls.setup({
  log_level = "info",
  sources = {
    null_ls.builtins.diagnostics.rubocop.with({
      command = function()
        if should_use_bundler(vim.fn.getcwd()) then
          return "bundle"
        else
          return "rubocop"
        end
      end,
      -- null-ls はデフォルトで cwd を project-root にしてしまうようなため、monorepo 構成だとうまく動かない
      -- 具体的には project-root で bundle exec rubocop.. を実行しようとするが、Gemfile などはその1つ下のディレクトリに存在するので rubocop の実行に失敗する
      -- そのため、project-root ではなく、Gemfile などが存在するディレクトリを cwd にするようにしている
      cwd = function()
        local cwd = vim.fn.getcwd()
        if should_use_bundler(cwd) then
          local paths = vim.fs.find({ ".rubocop.yml", "Gemfile" }, { upward = true, path = cwd })
          if #paths == 0 then
            return null_ls_util.get_root()
          end

          return vim.fs.dirname(paths[1])
        else
          return null_ls_util.get_root()
        end
      end,
      args = function()
        local args = {
          "-f",
          "json",
          "--force-exclusion",
          "--stdin",
          "$FILENAME",
        }

        if should_use_bundler(vim.fn.getcwd()) then
          table.insert(args, 1, "exec")
          table.insert(args, 2, "rubocop")

          return args
        else
          return args
        end
      end,
      -- ruby の version と parser(gem) の version が不一致だと警告が出るが、
      -- それにより diagnostics が動かなくなってしまう. 警告を抑制するために指定
      env = {
        RUBYOPT = "-W0",
      },
      diagnostics_format = "[#{c}] #{m}",
    }),
    null_ls.builtins.formatting.rubocop.with({
      command = function()
        if should_use_bundler(vim.fn.getcwd()) then
          return "bundle"
        else
          return "rubocop"
        end
      end,
      args = function()
        local args = {
          "-A",
          "-f",
          "quiet",
          "--stderr",
          "--stdin",
          "$FILENAME",
        }

        if should_use_bundler(vim.fn.getcwd()) then
          table.insert(args, 1, "exec")
          table.insert(args, 2, "rubocop")

          return args
        else
          return args
        end
      end,
    }),
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.sql_formatter,
  },
})
