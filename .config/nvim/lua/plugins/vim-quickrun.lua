-- * opener:
--   - 実行結果を水平分割でウィンドウ下部に表示する
--   - 実行結果のウィンドウにカーソルを移動させない
-- * close_on_empty: 実行結果が空の場合、バッファを自動で閉じる
vim.g.quickrun_config = {
  _ = {
    ['outputter/buffer/opener'] = ':botright 8split',
    ['outputter/buffer/close_on_empty'] = true,
  },
}
