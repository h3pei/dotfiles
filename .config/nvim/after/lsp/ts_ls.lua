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
}
