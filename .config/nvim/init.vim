" --------
" vim-plug
" --------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale', { 'for': ['ruby', 'javascript', 'typescript'] }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-test/vim-test', { 'for': 'ruby' }
call plug#end()

" ----------------
" General settings
" ----------------
set autoread " 開いているバッファに外部で変更があった場合に読みこみ直す
set cmdheight=2
set confirm
set expandtab " <Tab>の代わりに空白を使う
set foldlevel=99 " NOTE: This setting makes `zm` command ineffective
set foldmethod=indent
set hidden
set ignorecase
set laststatus=2
set nobackup
set nostartofline
set noswapfile
set nowritebackup
set number
set scrolloff=5 " 指定行数分の余裕を持たせて上下にスクロールさせる
set shiftwidth=4 " 自動インデントの各段階に使われる空白の数
set shortmess+=c
set signcolumn=yes
set smartcase " ignorecaseと合わせることで、小文字で検索した場合はcase insensitive, 大文字で検索した場合はcase sensitiveになる
set smartindent
set softtabstop=4 " INSERT modeで<Tab>の値として使用する空白の数
set tabstop=4 " ファイル内の<Tab>に対応する空白の数
set updatetime=300
set wildchar=<tab>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " ワイルドカードの展開時とファイル・ディレクトリ名の補完時に無視する
set wildmode=list:longest,full

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
inoremap <C-a> <C-o>^
inoremap <C-e> <End>
inoremap <C-k> <C-o>D
inoremap <C-d> <Del>

" Delete from the beggining of the line till the cursor
nnoremap <S-h> d^

" Toggle folding
nnoremap <leader>F za

" Turn off highlithing
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" Switch tabs
nnoremap <silent> <leader>n gt
nnoremap <silent> <leader>p gT

" Move lines
" see: https://qiita.com/itmammoth/items/312246b4b7688875d023
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

" Move jump list
" memo: plusとminusを使いたかったが、ASCII standardではない文字のため割り当てられなかった
" see: https://vimhelp.org/vim_faq.txt.html#faq-20.5
nnoremap <C-l> <C-I>
nnoremap <C-h> <C-O>

" Remove whitespece
nnoremap <silent> <leader>fw :FixWhitespace<CR>

" Toggle file explorer (NERDTree)
map <silent> <C-n> :NERDTreeToggle<CR>

" Comment in / out (NERD COMMENTER)
nmap <leader>, <Plug>NERDCommenterToggle
vmap <leader>, <Plug>NERDCommenterToggle

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
" commands
" ---------------
" Format json by jq command
command! FormatJson %!jq

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
  \ 'coc-svelte',
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
\ 'typescript': ['prettier'],
\}
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ }
let g:ale_javascript_prettier_use_local_config = 1

" test.vim
let test#strategy = "neovim"
let g:test#runner_commands = ['RSpec']

" typescript-vim
let g:typescript_indent_disable = 1

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
