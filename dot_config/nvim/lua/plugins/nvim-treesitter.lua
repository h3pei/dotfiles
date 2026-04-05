local parsers = {
  "comment",
  "css",
  "diff",
  "gitcommit",
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
    if not pcall(vim.treesitter.start) then
      vim.bo.syntax = "on"
    end
  end,
})
