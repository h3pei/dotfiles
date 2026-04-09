vim.loader.enable()

-- NOTE: 読み込み順序に注意
require("base")
require("folding")
require("mappings")
require("plugins")
require("colorscheme")
require("commands")
require("lsp")
-- マシン固有の設定があれば読み込む (lua/local.lua)
pcall(require, "local")
