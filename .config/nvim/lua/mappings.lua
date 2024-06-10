-- Use <Space> as Leader key (default: '\')
vim.g.mapleader = " "
local noremap = { noremap = true }
local noremap_and_silent = { noremap = true, silent = true }

-- Disables Ex mode && For QuickFix
vim.keymap.set("n", "Q", "<Nop>", noremap_and_silent)
vim.keymap.set("n", "Qo", "<Cmd>copen<CR>", noremap_and_silent)
vim.keymap.set("n", "Qc", "<Cmd>cclose<CR>", noremap_and_silent)
vim.keymap.set("n", "Ql", "<Cmd>clist<CR>", noremap_and_silent)

-- For INSERT mode (shell-like mapping setup)
-- memo: <C-u> -> Delete from the beggining of the line till the cursor
vim.keymap.set("i", "<C-n>", "<Down>", noremap_and_silent)
vim.keymap.set("i", "<C-p>", "<Up>", noremap_and_silent)
vim.keymap.set("i", "<C-b>", "<Left>", noremap_and_silent)
vim.keymap.set("i", "<C-f>", "<Right>", noremap_and_silent)
vim.keymap.set("i", "<C-h>", "<BS>", noremap_and_silent)
vim.keymap.set("i", "<C-a>", "<C-o>^", noremap_and_silent)
vim.keymap.set("i", "<C-e>", "<End>", noremap_and_silent)
vim.keymap.set("i", "<C-k>", "<C-o>D", noremap_and_silent)
vim.keymap.set("i", "<C-d>", "<Del>", noremap_and_silent)

-- Toggle folding
vim.keymap.set("n", "<Leader>ff", "za", noremap_and_silent)
vim.keymap.set("n", "<Leader>F", "<Cmd>%foldopen!<CR>", noremap_and_silent)

-- Clear search highlighting
vim.keymap.set("n", "<Leader>h", ":noh<CR>")

-- Operate buffers
vim.keymap.set("n", "<C-l>", "<Cmd>BufferNext<CR>", noremap_and_silent)
vim.keymap.set("n", "<C-h>", "<Cmd>BufferPrevious<CR>", noremap_and_silent)
vim.keymap.set("n", "<Leader>bd", "<Cmd>BufferClose<CR>", noremap_and_silent)
vim.keymap.set("n", "<Leader>bD", "<Cmd>BufSweep<CR>", noremap_and_silent)

-- Move lines
-- see: https://qiita.com/itmammoth/items/312246b4b7688875d023
vim.keymap.set("n", "<C-Up>", "\"zdd<Up>\"zP", noremap)
vim.keymap.set("n", "<C-Down>", "\"zdd\"zp", noremap)
vim.keymap.set("v", "<C-Up>", "\"zx<Up>\"zP`[V`]", noremap)
vim.keymap.set("v", "<C-Down>", "\"zx\"zp`[V`]", noremap)

-- Move jump list
-- * plusとminusを使いたかったが、ASCII standardではない文字のため割り当てられなかった
-- * see: https://vimhelp.org/vim_faq.txt.html#faq-20.5
-- * CTRL+f と CTRL+b はページのスクロールで時々使うことがあるが、実験的にジャンプリストの移動にしてみる. 合わなかったら戻そう
vim.keymap.set("n", "<C-f>", "<C-I>", noremap_and_silent)
vim.keymap.set("n", "<C-b>", "<C-O>", noremap_and_silent)

-- Remove whitespece
vim.keymap.set("n", "<Leader>fw", "<Cmd>FixWhitespace<CR>", noremap_and_silent)

-- Toggle file explorer (NvimTree)
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>", noremap_and_silent)

-- Register (neoclip)
vim.keymap.set("n", "\"", "<Cmd>Telescope neoclip<CR>", noremap_and_silent)
vim.keymap.set("v", "\"", "<Cmd>Telescope neoclip<CR>", noremap_and_silent)

-- Linting & Formatting
vim.keymap.set("n", "<Leader>f", function()
  vim.lsp.buf.format({ async = true })
end)
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)

-- Run rspec (rspec.nvim)
vim.keymap.set("n", "<Leader>rn", "<Cmd>RSpecNearest<CR>", noremap_and_silent)
vim.keymap.set("n", "<Leader>rf", "<Cmd>RSpecCurrentFile<CR>", noremap_and_silent)
vim.keymap.set("n", "<Leader>rF", "<Cmd>RSpecOnlyFailures<CR>", noremap_and_silent)
vim.keymap.set("n", "<Leader>rr", "<Cmd>RSpecRerun<CR>", noremap_and_silent)
vim.keymap.set("n", "<Leader>rs", "<Cmd>RSpecShowLastResult<CR>", noremap_and_silent)

-- vim-fold-cycle
vim.keymap.set("n", "<Tab>", "<Plug>(fold-cycle-open)")
vim.keymap.set("n", "<S-Tab>", "<Plug>(fold-cycle-close)")

-- copy-file-path.nvim
vim.keymap.set("n", "<Leader>cp", "<Cmd>CopyFilePath<CR>", noremap_and_silent)
