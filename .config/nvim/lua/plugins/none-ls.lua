local null_ls = require("null-ls")

null_ls.setup({
  log_level = "info",
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.biome,
    null_ls.builtins.formatting.sql_formatter,
  },
})
