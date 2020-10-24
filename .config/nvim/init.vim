call plug#begin('~/.local/share/nvim/plugged')
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/vim-auto-save'
call plug#end()

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_postsave_hook = 'FixWhitespace'
