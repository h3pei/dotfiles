require("kanagawa").setup({
  transparent = true,
  theme = "dragon",
  background = {
    dark = "dragon",
  },
})

vim.cmd.colorscheme("kanagawa")

-- NOTE: barbar.nvim の highlight の上書き (意図的にcolorschemeの後に書く)
-- current buffer の背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrent guibg=NONE")
-- current buffer の左に表示される Sign の背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrentSign guifg=#00dc82 guibg=NONE")
-- current buffer が編集状態になるときの背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrentMod guibg=NONE")

-- NOTE: 以下は kanagawa.nvim 固有かもしれない
-- SignColumn, LineNr, GitSigns の背景色とウィンドウの背景色を同化
vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight LineNr guibg=NONE")
vim.cmd("highlight GitSignsAdd guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")
vim.cmd("highlight GitSignsDelete guibg=NONE")
