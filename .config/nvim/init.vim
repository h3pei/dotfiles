" ----------------
" vim-plug
" ----------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale', { 'for': ['ruby', 'javascript'] }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'slim-template/vim-slim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-test/vim-test', { 'for': 'ruby' }
call plug#end()

" ----------------
" General settings
" ----------------
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
set autoread " 開いているバッファに外部で変更があった場合に読みこみ直す

colorscheme PaperColor

" 開いているバッファに外部で変更があった場合に読みこみ直す
" - `set autoread` だけだと `checktime` の実行タイミングでしかバッファの更新がされない
" - FocusGainedのタイミングでもchecktimeを実行し、バッファが更新されるようにする
" - なおvim-tmux-focus-eventsプラグインは、tmux上で起動したvimでもこの設定がうまく動くようにするために入れている
autocmd FocusGained * checktime

" thorファイルを `filetype=ruby` で開く
autocmd BufNewFile,BufRead *.thor set filetype=ruby

" ------------
" key mappings
" ------------
" Use <Space> as Leader key (default: '\')
let mapleader = "\<Space>"

" Disables Ex mode
nnoremap Q <Nop>

" For INSERT mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" Toggle folding
nnoremap <leader>F za

" Turn off highlithing
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" Switch tabs
nnoremap <silent> <leader>n gt
nnoremap <silent> <leader>p gT

" Move jump list
" memo: plusとminusを使いたかったが、ASCII standardではない文字のため割り当てられなかった
" see: https://vimhelp.org/vim_faq.txt.html#faq-20.5
nnoremap <C-l> <C-I>
nnoremap <C-h> <C-O>

" Remove whitespece
nnoremap <silent> <leader>fw :FixWhitespace<CR>

" Toggle file explorer (NERDTree)
map <silent> <C-n> :NERDTreeToggle<CR>

" Comment out / Comment in (NERD Commenter)
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" Search files (fzf.vim)
nnoremap <silent> ;f :GFiles<CR>
nnoremap <silent> ;F :Files<CR>
nnoremap <silent> ;r :Rg<CR>

" Go to definition/implementation/references (coc.nvim)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Fix linter problems (ALE)
nmap <silent> <leader>fp <Plug>(ale_fix)

" Run tests (test.vim)
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> tl :TestLast<CR>

" ---------------
" plugin settings
" ---------------
" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" NERDTree
let NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 3 " close after opening file and bookmark
let NERDTreeWinSize = 50

" NERD Commenter
let NERDSpaceDelims = 1

" fzf.vim
" - use Enter key for opening file as new tab
" - type `;f` to search files
" - type `;r` to search file contents
let g:fzf_action = { 'enter': 'tab drop' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --hidden --color=always --smart-case --glob "!.git" -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'),
  \   <bang>0,
  \ )

" coc.nvim
" - extensionは最低限としている
" - 不要になったextensionは `:CocUninstall :extension_name` で削除する
let g:coc_status_error_sign = 'E'
let g:coc_status_warning_sign = 'W'
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ ]

" ALE
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1 " ale_lintersとして定義したもののみ実行
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['prettier'],
\}
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['prettier'],
\ }
let g:ale_javascript_prettier_use_local_config = 1

" test.vim
let test#strategy = "neovim"
let g:test#runner_commands = ['RSpec']

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
