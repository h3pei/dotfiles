-- NOTE: `PaperColor_Theme_Options` variable must be placed anywhere before color PaperColor command.
vim.g.PaperColor_Theme_Options = {
  theme = {
    default = {
      transparent_background = true,
      override = {
        linenumber_fg  = { '#767676', '243' },
      },
    },
  },
}

vim.cmd 'colorscheme PaperColor'
