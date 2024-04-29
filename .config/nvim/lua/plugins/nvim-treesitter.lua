require("nvim-treesitter.configs").setup({
  auto_install = true,
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "comment",
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
    "svelte",
    "toml",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})
