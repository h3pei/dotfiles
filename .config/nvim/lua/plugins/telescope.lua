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
        -- デフォルトでは scroll up の挙動になるため無効化. カーソル位置より前を削除する挙動になる
        -- see: https://www.reddit.com/r/neovim/comments/qjxhif/telescope_use_cu_to_clear_search_field/
        ["<C-u>"] = false,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    -- find_files を使う場合は広めに検索をしたいはず、という状況を想定.
    -- よって .gitignore に登録されたファイルも対象にするし、隠しファイルも対象にする
    find_files = {
      find_command = { "rg", "--files", "--color", "never", "--hidden", "--glob=!.git" },
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

-- Telescope window の Title と Border をすべて白にする
-- https://github.com/nvim-telescope/telescope.nvim/blob/d4204618dddf1628e7a19ad4a7b910864d1120a5/plugin/telescope.lua#L24-L38
vim.api.nvim_set_hl(0, "TelescopeBorder" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeTitle" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptCounter" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle" , { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle" , { link = "Normal" })
