local lspconfig = require("lspconfig")
local common_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>re", vim.lsp.buf.rename)
end

-- MEMO: solargraphは `.git` or `Gemfile` が祖先を含めて見つからないと実行されないようだ
lspconfig.solargraph.setup({
  on_attach = common_on_attach,
  init_options = {
    formatting = false,
  },
  settings = {
    solargraph = {
      diagnostics = false,
    },
  },
})

lspconfig.sumneko_lua.setup({
  on_attach = common_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.jsonls.setup({
  on_attach = common_on_attach,
})

-- MEMO: Project root に tsconfig.json or jsconfig.json を配置する必要がある
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Prettierを使うことになると思われるため、LSPのformatは無効化
    -- 参考: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
    client.server_capabilities.documentFormattingProvider = false

    common_on_attach(client, bufnr)
  end,
})
