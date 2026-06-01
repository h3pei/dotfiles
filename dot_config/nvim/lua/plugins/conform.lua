local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- JS/TS 系は biome で整形する。
    -- biome はプロジェクトの biome.json を自動で探索・尊重し、無ければデフォルト設定で動くため
    -- 「プロジェクト設定があれば尊重、無ければグローバル」が conform 経由でそのまま実現できる。
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    css = { "biome" },
    sql = { "sql_formatter" },
    -- NOTE: ruby はここに「あえて書いていない」。
    -- ruby は conform に formatter を登録せず、下の <space>f が lsp_format = "fallback" により
    -- standalone の rubocop LSP (daemon 常駐で高速) に整形を委譲する。
    -- rubocop LSP はプロジェクトの .rubocop.yml のルールを尊重し、外ならグローバル設定で動く。
    -- （プロジェクトの rubocop バージョン/プラグインまでは尊重されないが、最終整形は CLI で行う前提で許容している）
  },
})

-- カレントバッファをフォーマットする
-- conform に対応フォーマッタがあればそれを使い、無ければ LSP のフォーマット (ruby は rubocop/ruby-lsp) にフォールバックする
vim.keymap.set("n", "<space>f", function()
  conform.format({ async = true, lsp_format = "fallback" })
end)
