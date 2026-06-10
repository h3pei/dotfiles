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

-- git hunk をリセットする (破壊的な操作になるためコマンド化している)
vim.api.nvim_create_user_command("RH", "Gitsigns reset_hunk", {})

-- プロファイリングの開始
-- 使い方: Profile コマンドを実行 -> 計測したい操作を行う -> :q などで終了 -> profile.txt に結果が出力される
vim.api.nvim_create_user_command("Profile", function()
  vim.cmd("profile start ./profile.txt")
  vim.cmd("profile func *")
  vim.cmd("profile file *")
end, {})

-- go-to-factory-bot.nvim
vim.api.nvim_create_user_command("GF", "GoToFactoryBot", {})

-- .yml だと syntax highlight が有効にならないため .yaml として認識させる
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yml" },
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

-- Quickfix window のキーマッピング
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "qf",
  callback = function()
    -- Esc で閉じる
    vim.keymap.set("n", "<Esc>", ":cclose<CR>", { buffer = true })
    -- <CR> で候補にジャンプしたあと quickfix を閉じる
    -- (`gd` 等で候補が複数表示されたときに、選択後 quickfix を残さないため)
    vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true, silent = true })
    -- quickfix を閉じずにジャンプしたい場合は <C-CR> を使う
    vim.keymap.set("n", "<C-CR>", "<CR>", { buffer = true, silent = true })
  end,
})
