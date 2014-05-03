" noremap  : ノーマルモード＋ビジュアルモード
" noremap! : コマンドラインモード＋インサートモード
" nnoremap : ノーマルモード限定
" vnoremap : ビジュアルモード（選択モード）限定
" cnoremap : コマンドラインモード限定
" inoremap : 挿入モード限定

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplete.vim'

filetype plugin indent on
syntax enable                  " ハイライトを有効化
syntax on                      " ハイライトを有効化
set noswapfile                 " スワップファイルをつくらない
set nocompatible               " vi互換モードをオフ（vimの拡張機能を有効)
set hidden                     " 編集中でも、保存しないで他のファイルを開けるようにする
set confirm                    " ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出す
set cmdheight=2                " 画面下部に表示されるコマンドラインの高さの設定
set showcmd                    " 入力したコマンドをステータスライン上に表示  例えばdを入力したらdと表示される
set scrolloff=5                " カーソルの上または下に表示される最小限の行数  5に設定してあるので、下に5行は必ず表示される
set visualbell                 " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set vb t_vb=                   " ビープを鳴らさない
set mouse=a                    " 全モードでマウスを有効化
set number                     " 行番号を表示
set showmatch                  " カッコの対応をハイライト
set cursorline                 " カーソル行のハイライト
set laststatus=2               " ステータスラインを常に表示する
set ruler                      " ステータスライン上にルーラーを表示する（カーソルが何行目の何列目に置かれているか）
set autoindent                 " オートインデント
set smartindent                " 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にする
set cindent                    " Cプログラムの自動インデント
set expandtab                  " タブキーを空白に変換
set backspace=indent,eol,start " バックスペースでインデント、改行を削除できるようにする
set wildmenu                   " コマンドラインモードでTABキーによる補完を有効化
set wildchar=<tab>             " コマンド補完を開始するキー
set history=1000               " コマンド・検索パターンの履歴数
set wildmode=list:longest,full
set wrapscan                   " 最後まで検索したら先頭に戻る
set ignorecase                 " 大文字小文字を無視する
set smartcase                  " 検索文字列に大文字が含まれている場合は区別して検索する
set hlsearch                   " 検索語を強調表示
set incsearch                  " インクリメンタルサーチを有効化
set ffs=unix,dos,mac           " 改行文字
set encoding=utf-8             " デフォルトエンコーディング
set fileencodings=utf-8
set nostartofline              " 移動コマンドを使ったとき、行頭に移動しない
set notimeout ttimeout ttimeoutlen=200 " キーコードはすぐにタイムアウト  マッピングはタイムアウトしない

" インサートモードでの挙動
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" [ファイルフォーマット][エンコーディング][改行タイプ] 行数, 列数／総列数
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0 

augroup vimrc
  autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd! FileType html setlocal shiftwidth=4 tabstop=4
  autocmd! FileType css setlocal shiftwidth=4 tabstop=4
  autocmd! FileType java setlocal shiftwidth=4 tabstop=4
  autocmd! FileType perl setlocal shiftwidth=4 tabstop=4
  autocmd! FileType cpp setlocal shiftwidth=4 tabstop=4
  autocmd! FileType php setlocal shiftwidth=4 tabstop=4
augroup END

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

" color scheme
set t_Co=256
let g:molokai_original = 1
colorscheme jellybeans

" ctrlp
let g:ctrolp_use_migemo    = 1 " ミゲモ検索
let g:ctrlp_jump_to_buffer = 2 " タブで開かれた場合はそのタブに切り替える
let g:ctrlp_open_new_file  = 't' " 新規作成時にタブで開く
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }

" easymotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ }

" nerdcommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"

" vim-over
nnoremap <silent> <Leader>m :OverCommandLine<CR>
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
