require("mason-lspconfig").setup({
  ensure_installed = {
    "solargraph",
    "lua_ls",
    "jsonls",
    "tsserver",
  },
})
