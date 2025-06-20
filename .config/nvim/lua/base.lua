vim.opt.autoread = true -- 開いているバッファに外部で変更があった場合に読みこみ直す
vim.opt.background = "dark"
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.encoding = "utf-8" -- Vim内部で使われる文字エンコーディング
vim.opt.expandtab = true -- <Tab>の代わりに空白を使う
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.fileencodings = { "utf-8", "sjis", "cp932" }
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.startofline = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.mouse = ""
vim.opt.scrolloff = 5 -- 指定行数分の余裕を持たせて上下にスクロールさせる
vim.opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal", "localoptions" }
vim.opt.shiftwidth = 2 -- 自動インデントの各段階に使われる空白の数
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true -- ignorecaseと合わせることで、小文字で検索した場合はcase insensitive, 大文字で検索した場合はcase sensitiveになる
vim.opt.smartindent = true -- 行頭の余白内で<Tab>を押すとshiftwidth分の空白が入る. 他ではtabstopまたはsofttabstop分の空白が入る
vim.opt.softtabstop = 2 -- INSERT modeで<Tab>を押したときに入る空白の数
vim.opt.tabstop = 2 -- ファイル内の<Tab>に対応する空白の数. 見た目上の設定であり実際にはTabが存在する. expandtabにより実際に空白が使われる
vim.opt.updatetime = 300
vim.opt.wildchar = ("\t"):byte()
vim.opt.wildignore = vim.opt.wildignore + { "*/tmp/*", "*.so", "*.swp", "*.zip" } -- ワイルドカードの展開時とファイル・ディレクトリ名の補完時に無視する
vim.opt.wildmode = { "list:longest", "full" }

-- Disable built-in plugins for startup performance
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
