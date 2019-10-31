if &compatible
    set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml("~/.config/nvim/dein.toml", {'lazy': 0})
  call dein#load_toml("~/.config/nvim/dein_lazy.toml", {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable


" setting
" 文字コードをUTF-8に設定
set fenc=utf8
" バックップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調
set cursorline
" 行末の１文字先までカーソルを移動できるように 
set virtualedit=onemore
" スマートインデント
set smartindent
" ビープ音の可視化
set visualbell
" 対応する括弧の表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
"コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位で移動
nnoremap j gj
nnoremap k gk
" 行内での改行を禁止
set nowrap
" カラースキーム
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

" Tab系
" Tab文字を半角スペース
set expandtab
" スペースいくつ分か
set tabstop=2
set shiftwidth=2
" 自動インデント
set autoindent

" 検索系
" 検索が最後まで行ったら最初に戻る
set wrapscan
" 検索語のハイライト
set hlsearch

" ヤンクをクリップボードにコピー
set clipboard+=unnamed
" backspaceで改行を削除
set backspace=2

" キーマップ
nnoremap s <Nop>
nnoremap ; :
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap st :tabnew<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let mapleader = "\<space>"

set ignorecase
set smartcase
set incsearch

