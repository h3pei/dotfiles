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
    null_ls.builtins.formatting.stylua,
  },
})
