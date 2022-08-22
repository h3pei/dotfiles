-- see: https://github.com/nvim-telescope/telescope.nvim/blob/d793de0f12d874c463e81edabee741b802c1a37a/lua/telescope/mappings.lua
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      -- `n` => normal mode
      n = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      -- `i` => insert mode
      i = {
        ["<Esc>"] = actions.close,
        -- WARN: 本来はカーソル位置より前を全削除にしたかったが、全体削除の挙動になっている
        ["<C-u>"] = { "<C-O>d^", type = "command" },
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    -- find_files を使う場合は広めに検索をしたいはず、という状況を想定.
    -- よって .gitignore に登録されたファイルも対象にするし、隠しファイルも対象にする
    find_files = {
      hidden = true,
      no_ignore = true,
    },
    -- live_grep では隠しファイルは対象にしたいが、.gitignoreされたファイルは不要なはず
    live_grep = {
      additional_args = function()
        return { "--hidden", "--glob=!.git" }
      end,
    },
  },
})

telescope.load_extension("fzf")
