-- Use <Space> as Leader key (default: '\')
vim.g.mapleader = " "
local noremap = { noremap = true }
local noremap_and_silent = { noremap = true, silent = true }

-- Disables Ex mode && For QuickFix
vim.keymap.set("n", "Q", "<Nop>", noremap_and_silent)
vim.keymap.set("n", "Qn", ":cnext<CR>", noremap_and_silent)
vim.keymap.set("n", "Qp", ":cprev<CR>", noremap_and_silent)
vim.keymap.set("n", "Ql", ":clist<CR>", noremap_and_silent)

-- For INSERT mode
vim.keymap.set("i", "<C-n>", "<Down>", noremap_and_silent)
vim.keymap.set("i", "<C-p>", "<Up>", noremap_and_silent)
vim.keymap.set("i", "<C-b>", "<Left>", noremap_and_silent)
vim.keymap.set("i", "<C-f>", "<Right>", noremap_and_silent)
vim.keymap.set("i", "<C-h>", "<BS>", noremap_and_silent)
vim.keymap.set("i", "<C-a>", "<C-o>^", noremap_and_silent)
vim.keymap.set("i", "<C-e>", "<End>", noremap_and_silent)
vim.keymap.set("i", "<C-k>", "<C-o>D", noremap_and_silent)
vim.keymap.set("i", "<C-d>", "<Del>", noremap_and_silent)

-- Delete from the beggining of the line till the cursor
vim.keymap.set("n", "<S-h>", "d^", noremap_and_silent)

-- Toggle folding
vim.keymap.set("n", "<leader>F", "za", noremap_and_silent)

-- Operate buffers
vim.keymap.set("n", "<C-l>", ":bnext<CR>", noremap_and_silent)
vim.keymap.set("n", "<C-h>", ":bprevious<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>bD", ":BufOnly<CR>", noremap_and_silent)

-- Move lines
-- see: https://qiita.com/itmammoth/items/312246b4b7688875d023
vim.keymap.set("n", "<C-Up>", "\"zdd<Up>\"zP", noremap)
vim.keymap.set("n", "<C-Down>", "\"zdd\"zp", noremap)
vim.keymap.set("v", "<C-Up>", "\"zx<Up>\"zP`[V`]", noremap)
vim.keymap.set("v", "<C-Down>", "\"zx\"zp`[V`]", noremap)

-- Move jump list
-- * plusとminusを使いたかったが、ASCII standardではない文字のため割り当てられなかった
-- * see: https://vimhelp.org/vim_faq.txt.html#faq-20.5
vim.keymap.set("n", "<leader>n", "<C-I>", noremap_and_silent)
vim.keymap.set("n", "<leader>p", "<C-O>", noremap_and_silent)

-- Remove whitespece
vim.keymap.set("n", "<leader>fw", ":FixWhitespace<CR>", noremap_and_silent)

-- Toggle file explorer (NERDTree)
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", noremap_and_silent)

-- Comment in / out (NERD COMMENTER)
vim.keymap.set("n", "<leader>,", "<Plug>NERDCommenterToggle", noremap_and_silent)
vim.keymap.set("v", "<leader>,", "<Plug>NERDCommenterToggle", noremap_and_silent)

-- Search files or buffers (telescope)
vim.keymap.set("n", ";f", ":Telescope git_files<CR>", noremap_and_silent)
vim.keymap.set("n", ";U", function()
  require("telescope.builtin").git_files({ git_command = { "git", "ls-files", "--others", "--exclude-standard" } })
end, noremap_and_silent)
vim.keymap.set("n", ";F", ":Telescope find_files<CR>", noremap_and_silent)
vim.keymap.set("n", ";r", ":Telescope live_grep<CR>", noremap_and_silent)
vim.keymap.set("n", ";b", ":Telescope buffers<CR>", noremap_and_silent)
vim.keymap.set("n", ";q", ":Telescope quickfix<CR>", noremap_and_silent)

-- " Run tests (test.vim)
vim.keymap.set("n", "tn", ":TestNearest<CR>", noremap_and_silent)
vim.keymap.set("n", "tf", ":TestFile<CR>", noremap_and_silent)
vim.keymap.set("n", "tl", ":TestLast<CR>", noremap_and_silent)
