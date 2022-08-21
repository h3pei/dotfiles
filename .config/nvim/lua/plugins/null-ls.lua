local function should_use_bundler(path)
  local current_path = require("plenary.path"):new(path)
  if
    vim.fn.filereadable(current_path .. "/Gemfile") == 1 and vim.fn.filereadable(current_path .. "/.rubocop.yml") == 1
  then
    return true
  end

  for _, parent_path in pairs(current_path:parents()) do
    if
      (parent_path ~= "/")
      and vim.fn.filereadable(parent_path .. "/Gemfile") == 1
      and vim.fn.filereadable(parent_path .. "/.rubocop.yml") == 1
    then
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
