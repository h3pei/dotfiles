"------------------------------------------------------------
" 基本設定
"------------------------------------------------------------
set noswapfile            " スワップファイルをつくらない
set nocompatible          " vi互換モードをオフ（vimの拡張機能を有効)
set hidden                " 編集中でも、保存しないで他のファイルを開けるようにする
set confirm               " ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出す
set cmdheight=2           " 画面下部に表示されるコマンドラインの高さの設定
set showcmd               " 入力したコマンドをステータスライン上に表示  例えばdを入力したらdと表示される
set scrolloff=5           " カーソルの上または下に表示される最小限の行数  5に設定してあるので、下に5行は必ず表示される
set visualbell            " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set vb t_vb=              " ビープを鳴らさない
set mouse=a               " 全モードでマウスを有効化
set notimeout ttimeout ttimeoutlen=200 " キーコードはすぐにタイムアウト  マッピングはタイムアウトしない


"------------------------------------------------------------
" ステータスライン
"------------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示する
set ruler        " ステータスライン上にルーラーを表示する（カーソルが何行目の何列目に置かれているか）

" [ファイルフォーマット][エンコーディング][改行タイプ] 行数, 列数／総列数
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L


"------------------------------------------------------------
" インデント
"------------------------------------------------------------
set autoindent     " オートインデント
set smartindent    " 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にする
set cindent        " Cプログラムの自動インデント
set expandtab      " タブキーを空白に変換

" バックスペースでインデント、改行を削除できるようにする
set backspace=indent,eol,start

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0
set tabstop=2
augroup vimrc
  autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd! FileType html setlocal shiftwidth=4 tabstop=2
  autocmd! FileType css setlocal shiftwidth=4 tabstop=2
  autocmd! FileType java setlocal shiftwidth=4 tabstop=2
  autocmd! FileType perl setlocal shiftwidth=4 tabstop=2
  autocmd! FileType cpp setlocal shiftwidth=4 tabstop=2
  autocmd! FileType php setlocal shiftwidth=4 tabstop=2
augroup END

" MEMO
" autoindent  : 改行時に半角スペース8文字を挿入する
" smartindent : 新しい行をつくったときに高度な自動インデントを行う  cindentがONだと無効化される
" tabstop     : タブ文字の幅を設定する  デフォルトは8
" expandtab   : TABキー入力時に、タブ文字の代わりにスペースにする
" softtabstop : タブ文字を入力した際にタブ文字の代わりに挿入されるホワイトスペースの量を設定する  shiftwidthと同じ値にすると良い
" shiftwidth  : 「>>」等のコマンドや自動インデントの際に使う1レベル分のインデント量を設定する  tabstopと同じ値にすると良い


"------------------------------------------------------------
" 表示
"------------------------------------------------------------
set number     " 行番号を表示
set showmatch  " カッコの対応をハイライト
set cursorline " カーソル行のハイライト

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


"------------------------------------------------------------
" 補完
"------------------------------------------------------------
set wildmenu       " コマンドラインモードでTABキーによる補完を有効化
set wildchar=<tab> " コマンド補完を開始するキー
set history=1000   " コマンド・検索パターンの履歴数
set wildmode=list:longest,full

" wildmodeのオプション色々
" [none]       最初のマッチのみを補完する。
" full         次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" longest      共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" longest:full longestと似ているが、'wildmenu' " が有効ならばそれを開始する
" list"        複数のマッチがあるときは、全てのマッチを羅列する。
" list:full    複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
" list:longest 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される


"------------------------------------------------------------
" タグ
"------------------------------------------------------------
" とりあえず何もしない


"------------------------------------------------------------
" 検索
"------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭に戻る
set ignorecase " 大文字小文字を無視する
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set hlsearch   " 検索語を強調表示
set incsearch  " インクリメンタルサーチを有効化

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>


"------------------------------------------------------------
" 移動
"------------------------------------------------------------
set nostartofline " 移動コマンドを使ったとき、行頭に移動しない

" インサートモードでもfbnpで移動（Ctrlを押しながら）
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" インサートモードでも削除
inoremap <C-h> <BS>


"------------------------------------------------------------
" カラー
"------------------------------------------------------------
syntax enable " ハイライトを有効化
syntax on     " ハイライトを有効化


"------------------------------------------------------------
" エンコーディング
"------------------------------------------------------------
set ffs=unix,dos,mac   " 改行文字
set encoding=utf-8     " デフォルトエンコーディング
set fileencodings=utf-8

"------------------------------------------------------------
" その他
"------------------------------------------------------------
" Yの動作をDやCと同じにする
map Y y$

" マッピングに関するMEMO
" noreがつくものとつかないものの違い（mapとnoremapとか）
" noreがつかないものを使うと、キーの再割当てが発生する
" -> mapはキーシーケンスを展開した後、さらに別のマップを適用しようとする
" -> noremapは一度だけ展開する
" (例)
" map {A} {X}
" map {B} {A}
" 上のようにマッピングされていた場合、Bを押すとAが実行され、さらにAに割り当てられたXが実行される
" noremapだとマッピングを1度しか展開しない  混乱を避けるためにnore系を利用するのが無難かも

" noremap  : ノーマルモード＋ビジュアルモード
" noremap! : コマンドラインモード＋インサートモード
" nnoremap : ノーマルモード限定
" vnoremap : ビジュアルモード（選択モード）限定
" cnoremap : コマンドラインモード限定
" inoremap : 挿入モード限定


"------------------------------------------------------------
" プラグイン
"------------------------------------------------------------
"------------------
" molokai.vim and jellybeans.vim
"------------------
set t_Co=256
let g:molokai_original = 1
colorscheme jellybeans

"------------------
" neocomplete.vim
"------------------
"" Disable AutoCompPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"      \ 'default' : '',
"      \ 'vimshell' : $HOME.'/.vimshell_hist',
"      \ 'scheme' : $HOME.'/.gosh_completions'
"      \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif


"------------------
" ctrlp
"------------------
let g:ctrolp_use_migemo    = 1 " ミゲモ検索
let g:ctrlp_jump_to_buffer = 2 " タブで開かれた場合はそのタブに切り替える
let g:ctrlp_open_new_file  = 't' " 新規作成時にタブで開く
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-a>'],
    \ }


"------------------
" easymotion
"------------------
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


"------------------
" lightline.vim
"------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ }


"------------------
" nerdcommenter
"------------------
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle


"------------------
" yankround.vim
"------------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" pを押した後以外ではctrlpを起動する
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"


"------------------
" vim-over
"------------------
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>


"------------------
" NeoBundle.vim
"------------------
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'      " プラグイン管理
NeoBundle 'Shougo/vimproc'            " 非同期処理のため
NeoBundle 'VimClojure'                " vimにおけるクロージャの開発環境
NeoBundle 'Shougo/vimshell'           " vimからシェルを起動する
NeoBundle 'Shougo/unite.vim'          " vim上で使用出来る統合ユーザーインターフェース
"NeoBundle 'Shougo/neocomplete.vim'   " 補完 vim7.3.885以上が必要
NeoBundle 'Shougo/neocomplcache.vim'  " 補完
NeoBundle 'Shougo/neosnippet'         " スニペット
NeoBundle 'jpalardy/vim-slime'        " ??
NeoBundle 'mattn/emmet-vim'           " zen-codingの後継
NeoBundle 'othree/html5.vim'          " html5のタグのカラー
NeoBundle 'Townk/vim-autoclose'       " カッコやダブルコーテーションを自動で閉じる
NeoBundle 'kien/ctrlp.vim.git'        " コマンドラインでのファイル補完
NeoBundle 'tpope/vim-pathogen'        " プラグイン管理
NeoBundle 'thinca/vim-quickrun'       " 各種ソースコードをすばやく実行
NeoBundle 'scrooloose/nerdcommenter'  " コメントアウト<Leader>c<Space> コメントアウト解除<Leadar>cu
NeoBundle 'Lokaltog/vim-easymotion'   " 行移動の高速化
NeoBundle 'tpope/vim-surround'        " テキストオブジェクトの強化
NeoBundle 'itchyny/lightline.vim'     " ステータスラインの改造
NeoBundle 'vim-scripts/Align'         " コードの整列
NeoBundle 'tomasr/molokai'            " カラースキーム
NeoBundle 'LeafCage/yankround.vim'    " ヤンク機能の拡張
NeoBundle 'osyo-manga/vim-over'       " 置換機能の拡張
NeoBundle 'jiangmiao/simple-javascript-indenter' " JSのインデント
NeoBundle 'jelera/vim-javascript-syntax' " JSのシンタックス
NeoBundle 'vim-scripts/jQuery'

filetype plugin indent on     " required!
