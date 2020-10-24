call plug#begin('~/.local/share/nvim/plugged')
Plug 'bronson/vim-trailing-whitespace'
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

" key mapping for INSERT mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_postsave_hook = 'FixWhitespace'
