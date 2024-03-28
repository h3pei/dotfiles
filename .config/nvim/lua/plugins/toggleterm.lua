local Terminal = require("toggleterm.terminal").Terminal
local tigTerminal = Terminal:new({
  cmd = "tig status",
  dir = "git_dir",
  direction = "float",
  hidden = true,
  on_open = function(term)
    -- 起動と同じコマンドで Terminal を close する
    -- hidden = true のため、close しても Terminal は残り、 tig のプロセスも残る
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", ";t", "<CMD>close<CR>", { noremap = true, silent = true })
  end,
})

function ToggleTigTerminal()
  tigTerminal:toggle()
end

vim.api.nvim_set_keymap("n", ";t", "<cmd>lua ToggleTigTerminal()<CR>", { noremap = true, silent = true })
