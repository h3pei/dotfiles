require("kanagawa").setup({
  transparent = true,
  theme = "wave",
  background = {
    dark = "wave",
  },
  colors = {
    -- see:
    -- - https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file#customization
    -- - https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/themes.lua
    -- - https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/colors.lua
    theme = {
      wave = {
        ui = {
          fg = "#ffffff", -- 文字色の変更
          bg_visual = "#0d408c", -- 範囲選択時の背景色の変更
          bg_gutter = "none", -- signcolumn の背景色の変更
        },
      },
    },
  },
})

vim.cmd.colorscheme("kanagawa")

-- LSP の hover や diagnostic のフロートウィンドウを見やすくするための設定
-- NOTE: transparent = true だとフロートウィンドウの背景も透過されるため、直接上書き
vim.cmd("highlight NormalFloat guibg=#000000")
vim.cmd("highlight FloatBorder guifg=#727169")

-- NOTE: barbar.nvim の highlight の上書き (意図的にcolorschemeの後に書く)
-- current buffer の背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrent guibg=NONE")
-- current buffer の左に表示される Sign の背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrentSign guifg=#00dc82 guibg=NONE")
-- current buffer が編集状態になるときの背景色とウィンドウの背景色を同化
vim.cmd("highlight BufferCurrentMod guibg=NONE")
