call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'vim-scripts/vim-auto-save'
call plug#end()

set number
set noswapfile
set hidden
set confirm
set ignorecase
set smartcase   " ignorecaseと合わせることで、小文字で検索した場合はcase insensitive, 大文字で検索した場合はcase sensitiveになる
set scrolloff=5 " 指定行数分の余裕を持たせて上下にスクロールさせる
set expandtab
set cindent
set smartindent
set wildchar=<tab>
set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set nostartofline
set laststatus=2

colorscheme PaperColor

" key mapping for INSERT mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" Pressing the esc key twice disables highlithing
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_postsave_hook = 'FixWhitespace'

" lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'relativepath', 'modified', 'readonly', 'gitbranch' ],
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
      \ },
      \ }
