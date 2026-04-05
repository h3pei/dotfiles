local parsers = {
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
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
