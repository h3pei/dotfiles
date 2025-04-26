require("mason-lspconfig").setup({
  ensure_installed = {
    "dockerls",
    "jsonls",
    "lua_ls",
    "rubocop",
    "ruby_lsp",
    "stimulus_ls",
    "tailwindcss",
    "ts_ls",
    "volar",
  },
})
