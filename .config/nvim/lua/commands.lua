-- signcolumn の背景色がずれてしまう事象への対策.
-- see: https://github.com/airblade/vim-gitgutter/issues/696
vim.cmd("highlight! link SignColumn LineNr")

-- 開いているバッファに外部で変更があった場合に読みこみ直す
-- * `set autoread` だけだと `checktime` の実行タイミングでしかバッファの更新がされない
-- * FocusGainedのタイミングでもchecktimeを実行し、バッファが更新されるようにする
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  command = "checktime",
})

-- Format json by jq command
-- `%` はファイル全体を対象とすることを意味する
vim.api.nvim_create_user_command("FormatJson", "%!jq", {})

-- git blame の現在行の情報を表示する
vim.api.nvim_create_user_command("GitBlame", "Gitsigns toggle_current_line_blame", {})

-- RSpecJump
vim.api.nvim_create_user_command("RJ", "RSpecJump", {})
