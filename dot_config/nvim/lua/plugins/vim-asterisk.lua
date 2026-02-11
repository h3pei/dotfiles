-- * による検索のとき、カーソルを移動しないようになる. vim default では次の検索結果に移動する
vim.api.nvim_set_keymap("n", "*", "<Plug>(asterisk-z*)", { noremap = false, silent = false })
vim.api.nvim_set_keymap("v", "*", "<Plug>(asterisk-gz*)", { noremap = false, silent = false })

-- memo: vim-asterisk により * の検索が smartcase になる. vim default では大文字小文字を同一視する
