" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

" neobundle setting
" =================
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/takaaki.furukawa/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/takaaki.furukawa/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'yanktmp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-ref'
NeoBundle 't9md/vim-chef'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
if system('uname -s') == "Darwin\n"
    NeoBundle 'rizzatti/dash.vim'
end

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let g:neobundle_default_git_protocol='https'

" basic setting
" =============
set visualbell
set encoding=utf8
set backspace=indent,eol,start
set showcmd
set autoindent
set smartindent

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
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↵

set shiftround
set infercase
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

" input setting
" =============
set textwidth=80
set paste
set clipboard+=unnamed
set expandtab
set tabstop=2
set shiftwidth=2

imap { {}<Left>
imap ' ''<Left>
imap " ""<Left>
imap [ []<Left>
imap ( ()<Left>

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
    autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.txt
    autocmd BufNewFile *.{sh\|py\|rb} %substitute#__DATE__#\=strftime('%Y-%m-%d')#ge
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

" syntastic checker
" =================
let g:syntastic_ruby_checkers = ['rubocop']

