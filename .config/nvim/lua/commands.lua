-- 開いているバッファに外部で変更があった場合に読みこみ直す
-- * `set autoread` だけだと `checktime` の実行タイミングでしかバッファの更新がされない
-- * FocusGainedのタイミングでもchecktimeを実行し、バッファが更新されるようにする
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  command = "checktime",
})

-- yankしたテキストの範囲をハイライトで可視化する
-- see: https://neovim.io/doc/user/lua.html#lua-highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ on_visual = false })
  end,
})

-- Format json by jq command
-- `%` はファイル全体を対象とすることを意味する
vim.api.nvim_create_user_command("FormatJson", "%!jq", {})

-- git blame の現在行の情報を表示する
vim.api.nvim_create_user_command("GitBlame", "Gitsigns toggle_current_line_blame", {})
