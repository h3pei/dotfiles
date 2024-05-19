-- see: https://github.com/nvim-telescope/telescope.nvim/blob/d793de0f12d874c463e81edabee741b802c1a37a/lua/telescope/mappings.lua
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

-- 選択した複数のファイルを一括で開くための関数
-- 現時点では、Tab で複数選択したあとに CR を押した場合でも、1つのファイルしか開けない
-- see: https://github.com/nvim-telescope/telescope.nvim/issues/1048
local multiple_select = function(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local selected_entries = current_picker:get_multi_selection()

  if #selected_entries > 1 then
    for _, entry in pairs(selected_entries) do
      if entry.path ~= nil then
        vim.api.nvim_command("edit! " .. entry.path)
      end
    end
  else
    -- default behavior
    actions.select_default(prompt_bufnr)
  end
end

telescope.setup({
  defaults = {
    mappings = {
      -- `n` => normal mode
      n = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = multiple_select,
      },
      -- `i` => insert mode
      i = {
        ["<Esc>"] = actions.close,
        -- デフォルトでは scroll up の挙動になるため無効化. カーソル位置より前を削除する挙動になる
        -- see: https://www.reddit.com/r/neovim/comments/qjxhif/telescope_use_cu_to_clear_search_field/
        ["<C-u>"] = false,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = multiple_select,
      },
    },
  },
  pickers = {
    -- find_files は以下のようなケースで使うことを想定
    -- * git 管理下ではないファイルも検索したい
    -- * そもそも git 管理下にないディレクトリ配下を検索したい
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
telescope.load_extension("neoclip")

-- Key mappings
vim.keymap.set("n", ";f", function()
  local ok = pcall(builtin.git_files)
  if not ok then
    require("telescope.utils").notify("git_files", { msg = "Can't find .git directory. Use `find_files` instead.", level = "ERROR" })
  end
end, {})
vim.keymap.set("n", ";U", function()
  builtin.git_files({ git_command = { "git", "ls-files", "--others", "--exclude-standard" } })
end, {})
vim.keymap.set("n", ";m", function()
  builtin.git_files({ git_command = { "git", "ls-files", "--modified", "--exclude-standard" } })
end, {})
vim.keymap.set("n", ";c", function()
  builtin.oldfiles({ only_cwd = true })
end, {})
vim.keymap.set("n", ";j", function()
  builtin.jumplist({ show_line = false })
end, {})
vim.keymap.set("n", ";r", function()
  builtin.live_grep()
end, {})
vim.keymap.set("n", ";F", function()
  builtin.find_files()
end, {})
vim.keymap.set("n", ";b", function()
  builtin.buffers()
end, {})

-- Telescope window の Title と Border をすべて白にする
-- https://github.com/nvim-telescope/telescope.nvim/blob/d4204618dddf1628e7a19ad4a7b910864d1120a5/plugin/telescope.lua#L24-L38
vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "Normal" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "Normal" })
