vim.loader.enable()

-- NOTE: 読み込み順序に注意
require("base")
require("folding")
require("mappings")
require("plugins")
require("colorscheme")
require("commands")
require("lsp")
