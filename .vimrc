" Neovundle setting
" ==============
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'yanktmp.vim'
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'ref.vim'

filetype plugin on
filetype indent on
" 挿入モード終了時に IME 状態を保存しない
"inoremap <silent> <Esc> <Esc>
"inoremap <silent> <C-[> <Esc>
" 「日本語入力固定モード」切り替えキー
"inoremap <silent> <C-j> <C-^>

" basic setting
" =============
set visualbell
set encoding=utf8
set backspace=indent,eol,start
set showcmd
set autoindent
set smartindent

" input setting
" =============
set textwidth=80
set paste
set expandtab

inoremap {} {}<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap [] []<Left>
inoremap () ()<Left>

if filereadable(expand('~/.vim/neocomplcache.vimrc'))
    source ~/.vim/neocomplcache.vimrc
endif


" search setting
" ==============
set history=100
set ignorecase
set smartcase
set wrapscan
set hlsearch

" view setting
" ============
syntax enable
set background=dark
colorscheme solarized
set number
set ruler
set title

" indent-guide
" ============
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 20
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" template
" ========
augroup templates
    autocmd!
    autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.txt
    autocmd BufNewFile *.sh %substitute#__DATE__#\=strftime('%Y-%m-%d')#ge
augroup END

" yanktmp setting
" ===============
map <silent> sy :call YanktmpYank()
map <silent> sp :call YanktmpPaste_p()
map <silent> sP :call YanktmpPaste_P()

" vim-ref
" =======
let g:ref_alc_encoding = 'utf-8'
let g:ref_alc_start_linenumber = 44
