local on_attach = function(client, bufnr)
  -- 無効状態のほうがインスタンス変数などが、見やすいハイライトになるため
  -- see: https://www.reddit.com/r/neovim/comments/109vgtl/how_to_disable_highlight_from_lsp/
  -- see: :help vim.lsp.semantic_tokens.start
  client.server_capabilities.semanticTokensProvider = nil

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>td", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>re", vim.lsp.buf.rename)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
end

vim.lsp.config("*", {
  on_attach = on_attach,
})

local lsp_servers = {
  "dockerls",
  "jsonls",
  "lua_ls",
  "rubocop",
  "ruby_lsp",
  "tailwindcss",
  "ts_ls",
  "vue_ls",
}

-- LSP servers のインストール
require("mason-lspconfig").setup({ ensure_installed = lsp_servers })

-- インストール済みの LSP servers を一括で有効化
-- vim.lsp.enable(require("mason-lspconfig").get_installed_servers())
vim.lsp.enable(lsp_servers)
