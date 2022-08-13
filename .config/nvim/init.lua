vim.g.polyglot_disabled = { 'markdown' }

-----------
-- vim-plug
-----------
vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale', { 'for': ['ruby', 'javascript', 'typescript'] }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-quickrun'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-test/vim-test', { 'for': 'ruby' }
call plug#end()
]]

-------------------
-- General settings
-------------------
vim.opt.autoread = true -- 開いているバッファに外部で変更があった場合に読みこみ直す
vim.opt.background = 'dark'
vim.opt.cmdheight = 2
vim.opt.confirm = true
vim.opt.encoding = 'utf-8' -- Vim内部で使われる文字エンコーディング
vim.opt.expandtab = true -- <Tab>の代わりに空白を使う
vim.opt.fileencoding = 'utf-8'
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.fileencodings = { 'utf-8', 'sjis', 'cp932' }
vim.opt.foldlevel = 99 -- NOTE: This setting makes `zm` command ineffective
vim.opt.foldmethod = 'indent'
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.startofline = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.scrolloff = 5 -- 指定行数分の余裕を持たせて上下にスクロールさせる
vim.opt.shiftwidth = 4 -- 自動インデントの各段階に使われる空白の数
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true -- ignorecaseと合わせることで、小文字で検索した場合はcase insensitive, 大文字で検索した場合はcase sensitiveになる
vim.opt.smartindent = true
vim.opt.softtabstop = 4 -- INSERT modeで<Tab>の値として使用する空白の数
vim.opt.tabstop = 4 -- ファイル内の<Tab>に対応する空白の数
vim.opt.updatetime = 300
vim.opt.wildchar = ('\t'):byte()
vim.opt.wildignore = vim.opt.wildignore + { '*/tmp/*', '*.so', '*.swp', "*.zip" } -- ワイルドカードの展開時とファイル・ディレクトリ名の補完時に無視する
vim.opt.wildmode = { 'list:longest', 'full' }

-- NOTE: `PaperColor_Theme_Options` variable must be placed anywhere before color PaperColor command.
vim.g.PaperColor_Theme_Options = {
  theme = {
    default = {
      transparent_background = true,
      override = {
        linenumber_fg  = { '#767676', '243' },
      },
    },
  },
}

vim.cmd 'colorscheme PaperColor'

------------
-- commands
------------

-- 開いているバッファに外部で変更があった場合に読みこみ直す
-- * `set autoread` だけだと `checktime` の実行タイミングでしかバッファの更新がされない
-- * FocusGainedのタイミングでもchecktimeを実行し、バッファが更新されるようにする
-- * なおvim-tmux-focus-eventsプラグインは、tmux上で起動したvimでもこの設定がうまく動くようにするために入れている
vim.api.nvim_create_autocmd('FocusGained', {
  pattern = '*',
  command = 'checktime'
})

-- Workaround a problem with vim-gitgutter.
-- https://github.com/airblade/vim-gitgutter/issues/696
vim.cmd 'highlight! link SignColumn LineNr'
vim.cmd 'autocmd ColorScheme * highlight! link SignColumn LineNr'

-- Format json by jq command
-- `%` はファイル全体を対象とすることを意味する
vim.api.nvim_create_user_command('FormatJson', '%!jq', {})

-- Customize Rg command (fzf.vim)
vim.api.nvim_create_user_command(
  'Rg',
  [[call fzf#vim#grep('rg --line-number --no-heading --hidden --color=always --smart-case --glob "!.git" -- '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'), <bang>0)]],
  { nargs = '*', bang = true }
)

-- List untracked files (fzf.vim)
-- "call fzf#run(fzf#wrap({'source': 'git ls-files --others --exclude-standard'}))",
-- "call fzf#run(fzf#wrap({'source': 'git ls-files --others --exclude-standard'}))",
vim.api.nvim_create_user_command(
  'GUntrackedFiles',
  function()
    vim.fn["fzf#run"](
      vim.fn["fzf#wrap"]("{'source': 'git ls-files --others --exclude-standard'}")
    )
  end,
  { nargs = 0, bang = true }
)

---------------
-- key mappings
---------------
-- Use <Space> as Leader key (default: '\')
vim.g.mapleader = " "

-- Disables Ex mode && For QuickFix
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', 'Qn', ':cnext<CR>', { noremap = true })
vim.keymap.set('n', 'Qp', ':cprev<CR>', { noremap = true })
vim.keymap.set('n', 'Ql', ':clist<CR>', { noremap = true })

-- For INSERT mode
vim.keymap.set('i', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('i', '<C-h>', '<BS>', { noremap = true })
vim.keymap.set('i', '<C-a>', '<C-o>^', { noremap = true })
vim.keymap.set('i', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<C-o>D', { noremap = true })
vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true })

-- Delete from the beggining of the line till the cursor
vim.keymap.set('n', '<S-h>', 'd^', { noremap = true })

-- Toggle folding
vim.keymap.set('n', '<leader>F', 'za', { noremap = true })

-- Turn off highlithing
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><ESC>', { noremap = true, silent = true })

-- Operate buffers
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bD', ':BufOnly<CR>', { noremap = true, silent = true })

-- Move lines
-- see: https://qiita.com/itmammoth/items/312246b4b7688875d023
vim.keymap.set('n', '<C-Up>', '"zdd<Up>"zP', { noremap = true })
vim.keymap.set('n', '<C-Down>', '"zdd"zp', { noremap = true })
vim.keymap.set('v', '<C-Up>', '"zx<Up>"zP`[V`]', { noremap = true })
vim.keymap.set('v', '<C-Down>', '"zx"zp`[V`]', { noremap = true })

-- Move jump list
-- * plusとminusを使いたかったが、ASCII standardではない文字のため割り当てられなかった
-- * see: https://vimhelp.org/vim_faq.txt.html#faq-20.5
vim.keymap.set('n', '<leader>n', '<C-I>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '<C-O>', { noremap = true, silent = true })

-- Remove whitespece
vim.keymap.set('n', '<leader>fw', ':FixWhitespace<CR>', { noremap = true })

-- Toggle file explorer (NERDTree)
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

-- Comment in / out (NERD COMMENTER)
vim.keymap.set('n', '<leader>,', '<Plug>NERDCommenterToggle')
vim.keymap.set('v', '<leader>,', '<Plug>NERDCommenterToggle')

-- Search files or buffers (fzf.vim)
-- * type `;f` to search files under git control
-- * type `;a` to search all files
-- * type `;r` to search file contents
vim.keymap.set('n', ';f', ':GFiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';F', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';b', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';U', ':GUntrackedFiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';a', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';r', ':Rg<CR>', { noremap = true, silent = true })

-- Go to definition/implementation/references (coc.nvim)
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Fix linter problems (ALE)
vim.keymap.set('n', '<leader>fp', '<Plug>(ale_fix)', { silent = true })

-- " Run tests (test.vim)
vim.keymap.set('n', 'tn', ':TestNearest<CR>', { silent = true })
vim.keymap.set('n', 'tf', ':TestFile<CR>', { silent = true })
vim.keymap.set('n', 'tl', ':TestLast<CR>', { silent = true })

------------------
-- plugin settings
------------------
vim.g.auto_save = true
vim.g.auto_save_in_insert_mode = false

-- NERDTree
vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeQuitOnOpen = 3 -- close after opening file and bookmark
vim.g.NERDTreeWinSize = 50

-- NERD Commenter
vim.g.NERDSpaceDelims = true

-- coc.nvim
-- * extensionは最低限としている
-- * 不要になったextensionは `:CocUninstall :extension_name` で削除する
vim.g.coc_status_error_sign = 'E'
vim.g.coc_status_warning_sign = 'W'
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-solargraph',
  'coc-tsserver',
  'coc-html',
}

-- ALE
vim.g.ale_disable_lsp = true
vim.g.ale_linters_explicit = true -- ale_lintersとして定義したもののみ実行
vim.g.ale_lint_on_enter = true
vim.g.ale_lint_on_save = true
vim.g.ale_lint_on_text_changed = false
vim.g.ale_lint_on_filetype_changed = false
vim.g.ale_lint_on_insert_leave = false
vim.g.ale_linters = {
    ruby = { 'rubocop' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
}
vim.g.ale_fix_on_save = false
vim.g.ale_fixers = {
  ruby = { 'rubocop' },
  javascript = { 'prettier' },
  typescript = { 'prettier' },
}
vim.g.ale_ruby_rubocop_executable = 'bundle'
vim.g.ale_ruby_rubocop_auto_correct_all = true
vim.g.ale_javascript_prettier_use_local_config = true

-- test.vim
vim.g['test#strategy'] = 'dispatch'
vim.g['test#runner_commands'] = { 'RSpec' }

-- fzf.vim
-- Send results of grep to quickfix list
-- see: https://github.com/junegunn/fzf.vim/issues/185#issuecomment-322120216
vim.cmd [[
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \   'ctrl-q': function('s:build_quickfix_list'),
  \ }

let $FZF_DEFAULT_OPTS = '--bind ctrl-alt-a:select-all,ctrl-d:deselect-all'
]]

-- quickrun.vim
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

-- rails.vim
vim.g.rails_projections = {
  ["app/controllers/*_controller.rb"] = {
    test = {
      "spec/requests/{}_spec.rb",
      "spec/controllers/{}_spec.rb",
    },
  },
  ["spec/requests/*_spec.rb"] = {
    alternate = {
      "app/controllers/{}_controller.rb",
    },
  },
}

-- lualine
require('lualine').setup({
  options = {
     icons_enabled = false,
     theme = 'dracula',
     component_separators = '',
     section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
})
