require("nvim-treesitter.configs").setup {
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "markdown",
    "proto",
    "python",
    "lua",
    "ruby",
    "sql",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  auto_install = true,
}
