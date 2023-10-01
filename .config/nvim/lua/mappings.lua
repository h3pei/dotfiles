-- Use <Space> as Leader key (default: '\')
vim.g.mapleader = " "
local noremap = { noremap = true }
local noremap_and_silent = { noremap = true, silent = true }

-- Disables Ex mode && For QuickFix
vim.keymap.set("n", "Q", "<Nop>", noremap_and_silent)
vim.keymap.set("n", "Qo", ":copen<CR>", noremap_and_silent)
vim.keymap.set("n", "Qc", ":cclose<CR>", noremap_and_silent)
vim.keymap.set("n", "Ql", ":clist<CR>", noremap_and_silent)

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
vim.keymap.set("n", "<leader>ff", "za", noremap_and_silent)
vim.keymap.set("n", "<leader>F", ":%foldopen!<CR>", noremap_and_silent)

-- Operate buffers
vim.keymap.set("n", "<C-l>", "<Cmd>BufferNext<CR>", noremap_and_silent)
vim.keymap.set("n", "<C-h>", "<Cmd>BufferPrevious<CR>", noremap_and_silent)
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>bd", "<Cmd>BufferClose<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>bD", ":BufSweep<CR>", noremap_and_silent)

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

-- Toggle file explorer (NvimTree)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", noremap_and_silent)

-- Search files or buffers (telescope)
vim.keymap.set("n", ";f", function()
  local ok = pcall(require("telescope.builtin").git_files)
  if not ok then
    require("telescope.utils").notify("git_files", { msg = "Can't find .git directory. Use `find_files` instead.", level = "ERROR" })
  end
end, noremap_and_silent)
vim.keymap.set("n", ";U", function()
  require("telescope.builtin").git_files({ git_command = { "git", "ls-files", "--others", "--exclude-standard" } })
end, noremap_and_silent)
vim.keymap.set("n", ";m", function()
  require("telescope.builtin").git_files({ git_command = { "git", "ls-files", "--modified", "--exclude-standard" } })
end, noremap_and_silent)
vim.keymap.set("n", ";F", ":Telescope find_files<CR>", noremap_and_silent)
vim.keymap.set("n", ";r", ":Telescope live_grep<CR>", noremap_and_silent)
vim.keymap.set("n", ";b", ":Telescope buffers<CR>", noremap_and_silent)

-- Linting & Formatting
vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format({ async = true }) end)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)

-- Run rspec (rspec.nvim)
vim.keymap.set("n", "<leader>rn", ":RSpecNearest<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>rf", ":RSpecCurrentFile<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>rF", ":RSpecOnlyFailures<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>rr", ":RSpecRerun<CR>", noremap_and_silent)
vim.keymap.set("n", "<leader>rs", ":RSpecShowLastResult<CR>", noremap_and_silent)

-- vim-fold-cycle
vim.keymap.set("n", "<Tab>", "<Plug>(fold-cycle-open)")
vim.keymap.set("n", "<S-Tab>", "<Plug>(fold-cycle-close)")
