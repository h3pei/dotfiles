require("nightfox").setup({
  options = {
    transparent = true,
  },
  palettes = {
    nightfox = {
      -- visual selection bg color
      sel0 = "#196a89",
    }
  }
})

vim.cmd("colorscheme nightfox")
