" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

" Neovundle setting
" ==============
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

let g:neobundle_default_git_protocol='https'

NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'yanktmp.vim'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'https://github.com/t9md/vim-chef.git'
NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
NeoBundle 'kien/ctrlp.vim'

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
set tabstop=2
set shiftwidth=2

inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap [ []<Left>
inoremap ( ()<Left>

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

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" edit setting
" ============
syntax enable
" set background=dark
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
set list
set number
set ruler
set title
set t_vb=
set novisualbell
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

set shiftround
set infercase
set virtualedit=all
set hidden
set switchbuf=useopen
set showmatch
set matchtime=3

set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start

if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus,unnamed 
else
    set clipboard& clipboard+=unnamed
endif

set nowritebackup
set nobackup
set noswapfile

" indent-guide
" ============
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 20
let g:indent_guides_guide_size = 1 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" template
" ========
augroup templates
    autocmd!
    autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.txt
    autocmd BufNewFile *.py 0r ~/.vim/templates/py.txt
    autocmd BufNewFile *.{sh\|py} %substitute#__DATE__#\=strftime('%Y-%m-%d')#ge
augroup END

" keymap setting
" ==============
map <silent> sy :call YanktmpYank()
map <silent> sp :call YanktmpPaste_p()
map <silent> sP :call YanktmpPaste_P()

nmap <silent> <Esc><Esc> :nohlsearch<CR>
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
vnoremap v $h
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>


" vim-chef setting
" ================
if filereadable(expand('~/.vim/vim-chef.vimrc'))
    source ~/.vim/vim-chef.vimrc
endif

" vim-ref
" =======
let g:ref_alc_encoding = 'utf-8'
let g:ref_alc_start_linenumber = 44


