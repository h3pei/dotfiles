call plug#begin('~/.local/share/nvim/plugged')
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale', { 'for': 'ruby' } " 現時点ではrubyのみで必要
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-test/vim-test'
call plug#end()

set number
set noswapfile
set nostartofline
set nobackup
set nowritebackup
set hidden
set confirm
set ignorecase
set smartcase " ignorecaseと合わせることで、小文字で検索した場合はcase insensitive, 大文字で検索した場合はcase sensitiveになる
set scrolloff=5 " 指定行数分の余裕を持たせて上下にスクロールさせる
set expandtab
set cindent
set smartindent
set wildchar=<tab>
set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set laststatus=2
set cmdheight=2
set foldmethod=indent
set foldlevel=99 " NOTE: This setting makes `zm` command ineffective
set updatetime=300
set shortmess+=c
set signcolumn=yes

autocmd BufNewFile,BufRead *.thor set filetype=ruby

colorscheme PaperColor

" change Leader key to <Space> (default: '\')
let mapleader = "\<Space>"

" Toggle fold
nnoremap <leader>F za

" key mapping for INSERT mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" pressing the esc key twice disables highlithing
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" customize keymap for switching tabs
nnoremap <silent> <leader>n gt
nnoremap <silent> <leader>p gT

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
nnoremap <silent> <leader>fw :FixWhitespace<CR>

" NERDTree
let NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 3 " close after opening file and bookmark
let NERDTreeWinSize = 50
map <silent> <C-n> :NERDTreeToggle<CR>

" NERD Commenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" fzf.vim
" - use Enter key for opening file as new tab
" - type `;f` to search files
" - type `;r` to search file contents
let g:fzf_action = { 'enter': 'tab drop' }
nnoremap <silent> ;f :GFiles<CR>
nnoremap <silent> ;F :Files<CR>
nnoremap <silent> ;r :Rg<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --hidden --color=always --smart-case --glob "!.git" -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'),
  \   <bang>0,
  \ )

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_status_error_sign = 'E'
let g:coc_status_warning_sign = 'W'
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-solargraph',
  \ ]

" ale
nmap <leader>fp <Plug>(ale_fix)
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1 " ale_lintersとして定義したもののみ実行
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {
\ 'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ }

" test-vim
let test#strategy = "neovim"
let g:test#runner_commands = ['RSpec']
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> tl :TestLast<CR>

" lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'cocstatus', 'relativepath', 'modified', 'readonly', 'gitbranch' ],
      \   ],
      \   'right': [
      \     [ 'column', 'line_info' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ],
      \ },
      \ 'component': {
      \   'line_info' : '%l/%L',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'cocstatus': 'coc#status',
      \ },
      \ }
