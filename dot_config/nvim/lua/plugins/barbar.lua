-- vim.g.barbar_auto_setup = false
require("barbar").setup({
  animation = false,
  clickable = false,
  -- 新しい buffer を末尾に追加する
  insert_at_end = true,
  icons = {
    -- closeボタンは非表示にする
    button = false,
  },
  -- nvim-tree を開いたときにoffsetを設定する
  sidebar_filetypes = {
    NvimTree = true,
  },
})
