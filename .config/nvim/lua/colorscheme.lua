require("nightfox").setup({
  options = {
    transparent = true,
  },
  palettes = {
    nightfox = {
      -- visual selection bg color
      sel0 = "#196a89",
    },
  },
})

vim.cmd.colorscheme("terafox")

-- NOTE: barbar.nvim の highlight の上書き (意図的にcolorschemeの後に書く)
-- current buffer の背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrent guibg=NONE")
-- current buffer の左に表示される Sign の背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrentSign guifg=#00dc82 guibg=NONE")
-- current buffer が編集状態になるときの背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrentMod guibg=NONE")
