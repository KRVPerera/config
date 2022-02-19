call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'takac/vim-hardtime'
"Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'KRVPerera/ballerina-vim', { 'branch': 'stable' }
"Plug '/Users/rukshanp/Projects/VimPlugin/vim-plug/ballerina-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'valloric/youcompleteme'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
"Plug 'skammer/vim-css-color'
"Plug 'chrisbra/Colorizer'


call plug#end()

let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 2
"let g:syntastic_java_checkers = []
autocmd! bufwritepost .vimrc source %
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let mapleader = ','

set background=dark
colorscheme solarized8

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
else
    let g:solarized_termcolours=256
endif
"
set guifont=Inconsolata-g\ 12
set omnifunc=syntaxComplete#Complete
set dictionary+=/usr/share/dict/words

set makeprg=make\ -C\ ./build\ -j9


set nocompatible
syntax on
set ruler
set showcmd
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set ic
set expandtab
set autoindent
set si

set history=1
set undolevels=100
set is
set hlsearch
set showmatch
set magic
set laststatus=2
set wrap
set clipboard=unnamed

inoremap ii <Esc>
inoremap jj <Esc>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <C-L> <C-W><C-V>
nnoremap <C-J> :split<CR>
set splitbelow
set splitright

nnoremap <C-O> :NERDTreeToggle<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:hardtime_default_on = 1
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

nnoremap <C-X> :syntime on<CR>
nnoremap <C-M> :syntime report<CR>

" Nerd tree changes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
