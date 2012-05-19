"======================================
" basic setting
"======================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" beep sound off
set visualbell
" encoding
set encoding=utf8
" backspaceで何でも消せるように
set backspace=indent,eol,start
" display incomplete command
set showcmd

"======================================
" inent setting
"======================================
" max of width
set textwidth=80
" コピーした時のオートインデントを無効にする
set paste
" tabを入力した時の半角スペースの個数
set softtabstop=4
" tab -> space
set expandtab
" auto indent
set autoindent
set smartindent
" 自動インデントの各段階に使われるスペースの個数
set shiftwidth=4
" コマンドライン補完が拡張モードで行われる
set wildmenu
" comment template
set commentstring=\ #\ %s
" すべての折畳を閉じた状態でファイルオープン
set foldlevel=0
" fileformat auto recognize
set fileformats=unix,dos,mac

"======================================
" scan setting
"======================================
set history=100
" 検索で大文字と小文字を区別しない。
set ignorecase
set smartcase
set wrapscan
" Do not increment search
"set noincsearch
" インクリメンタル検索ができるようになる。
set incsearch

"======================================
" view setting
"======================================
" syntax highlight setting in ~/.vim/syntax
" 
syntax on
" colorscheme setting in ~/.vim/colors
" colorscheme desert
colorscheme pyte
" colorscheme django
" colorscheme tidy
" colorscheme wombat
" colorscheme kate
let g:molokai_original = 1
" display line numbers on left side
set number
" カーソルの場所を表示する
set ruler
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
set scrolloff=5
" show the filename in the window titlebar
set title
" 検索結果文字列のハイライトを有効にする
set hlsearch
" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"======================================
" plugin setting
"======================================
" ftplugin
filetype on
filetype plugin on
" vimshell
"let g:VimShell_EnableInteractive = 1
" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" Most Recently Used (MRU)
let MRU_Max_Entries=20
let MRU_Window_Height=6
" template
autocmd BufNewFile *.sh 0r $HOME/.vim/templates/sh.txt
