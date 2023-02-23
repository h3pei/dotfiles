require("mason-lspconfig").setup({
  ensure_installed = {
    "dockerls",
    "jsonls",
    "lua_ls",
    "solargraph",
    "tsserver",
  },
})
