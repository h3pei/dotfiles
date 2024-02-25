require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "proto",
    "python",
    "ruby",
    "sql",
    "toml",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  auto_install = true,
})
