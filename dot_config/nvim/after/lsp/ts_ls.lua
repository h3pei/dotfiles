local vue_language_server_path = vim.fn.expand("$MASON/packages/vue-language-server")

-- MEMO: Project root に tsconfig.json or jsconfig.json を配置する必要がある
return {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path .. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
  on_attach = function(_client, bufnr)
    -- 不足している import の自動追加
    vim.keymap.set("n", "<space>ai", function()
      vim.lsp.buf.code_action({
        -- Code Action の選択肢が1つの場合に自動適用する
        apply = true,
        context = {
          -- 返してほしい Code Action を限定する
          only = { "source.addMissingImports.ts" },
          -- 通常 Code Action はカーソル位置の diagnostics に基づいて提供されるが
          -- 空テーブルを渡すことでファイル全体に対するアクションを要求
          diagnostics = {},
        },
      })
    end, { buffer = bufnr })
  end,
}
