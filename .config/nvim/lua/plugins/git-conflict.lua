require("git-conflict").setup({
  -- FIXME: gitsigns に依存してしまっている
  highlights = {
    incoming = "GitSignsAdd",
    current = "GitSignsChange",
  },
})
