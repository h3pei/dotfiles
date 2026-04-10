local on_attach = function(client, bufnr)
  -- 無効状態のほうがインスタンス変数などが、見やすいハイライトになるため
  -- see: https://www.reddit.com/r/neovim/comments/109vgtl/how_to_disable_highlight_from_lsp/
  -- see: :help vim.lsp.semantic_tokens.start
  client.server_capabilities.semanticTokensProvider = nil

  -- MEMO: Neovim 0.10+ デフォルトマッピング
  -- K: hover
  -- gra: code_action
  -- gri: implementation
  -- grn: rename
  -- grr: references
  -- grt: type_definition
  -- grx: codelens.run
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end, bufopts)
  vim.keymap.set("n", "<C-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
  end, bufopts)
  vim.keymap.set("n", "<space>re", vim.lsp.buf.rename)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end)
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
  "pyright",
}

-- LSP servers のインストール
require("mason-lspconfig").setup({ ensure_installed = lsp_servers })

-- インストール済みの LSP servers を一括で有効化
vim.lsp.enable(require("mason-lspconfig").get_installed_servers())
