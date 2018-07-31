" noremap  : ノーマルモード＋ビジュアルモード
" noremap! : コマンドラインモード＋インサートモード
" nnoremap : ノーマルモード限定
" vnoremap : ビジュアルモード（選択モード）限定
" cnoremap : コマンドラインモード限定
" inoremap : 挿入モード限定

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/vim-auto-save'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-endwise'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/Align'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'w0ng/vim-hybrid'
Plug 'Shougo/neocomplete.vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
call plug#end()

syntax enable                  " ハイライトを有効化
syntax on                      " ハイライトを有効化
set ffs=unix,dos,mac           " 改行文字
set encoding=utf-8             " デフォルトエンコーディング
set fileencodings=utf-8
set ambiwidth=double           " □や○文字が崩れる問題を解決
set number                     " 行番号を表示
set noswapfile                 " スワップファイルをつくらない
set nocompatible               " vi互換モードをオフ（vimの拡張機能を有効)
set ruler                      " ステータスライン上にルーラーを表示する
set autoindent                 " オートインデント
set scrolloff=5                " カーソルの上または下に表示される最小限の行数  5に設定してあるので、下に5行は必ず表示される
set incsearch                  " インクリメンタルサーチを有効化
set hlsearch                   " 検索語を強調表示
set smartcase                  " 検索文字列に大文字が含まれている場合は区別して検索する
set ignorecase                 " 大文字小文字を無視する
set wrapscan                   " 最後まで検索したら先頭に戻る
set hidden                     " 編集中でも、保存しないで他のファイルを開けるようにする
set confirm                    " ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出す
set cmdheight=2                " 画面下部に表示されるコマンドラインの高さの設定
set showcmd                    " 入力したコマンドをステータスライン上に表示  例えばdを入力したらdと表示される
set visualbell                 " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set vb t_vb=                   " ビープを鳴らさない
set mouse=a                    " 全モードでマウスを有効化
set showmatch                  " カッコの対応をハイライト
set laststatus=2               " ステータスラインを常に表示する
set smartindent                " 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にする
set cindent                    " Cプログラムの自動インデント
set expandtab                  " タブキーを空白に変換
set backspace=indent,eol,start " バックスペースでインデント、改行を削除できるようにする
set wildmenu                   " コマンドラインモードでTABキーによる補完を有効化
set wildchar=<tab>             " コマンド補完を開始するキー
set history=1000               " コマンド・検索パターンの履歴数
set wildmode=list:longest,full
set nostartofline              " 移動コマンドを使ったとき、行頭に移動しない
set notimeout ttimeout ttimeoutlen=200 " キーコードはすぐにタイムアウト  マッピングはタイムアウトしない
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" インサートモードでのキーバインド変更
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
" inoremap <C-b> <BS>

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" [ファイルフォーマット][エンコーディング][改行タイプ] 行数, 列数／総列数
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

" 全角スペースのハイライト表示
" 参考：http://code-life.net/?p=2704
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" Yの動作をDやCと同じにする
map Y y$

" INSERTモードの時のみset paste状態にする
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" Golang
" [begin]-------------------------------------------
" gocodeを補完機能として使う（以下のコマンドでgocodeをインストールしておく必要がある）
" $ go get -u github.com/nsf/gocode
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" 補完内容の詳細化
set completeopt=menu,preview
" [end]---------------------------------------------

"
" color scheme
"
set t_Co=256
colorscheme jellybeans

"
" vim-auto-save
"
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

"
" ctrlp
"
" let g:ctrlp_map = '<c-P>'
let g:ctrlp_use_migemo = 1     " ミゲモ検索
let g:ctrlp_jump_to_buffer = 2  " タブで開かれた場合はそのタブに切り替える
let g:ctrlp_open_new_file = 't' " 新規作成時にタブで開く
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " .gitignoreに追加されたファイルを無視する
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }

"
" vim-markdown
"
let g:vim_markdown_folding_disabled=1 " 折りたたみ機能解除

"
" easymotion
"
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

"
" lightline.vim
"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ }

"
" nerdcommenter
"
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#dictionary#dictionaries = {
      \   'ruby': $HOME . '/.vim/dicts/dicts/ruby.dict',
      \ }

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']
