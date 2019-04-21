call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
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
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

call plug#end()

autocmd! bufwritepost .vimrc source %
au BufRead,BufNewFile *.upf,*.upf2 set filetype=upf
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set background=dark
colorscheme solarized8

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
else
    let g:solarized_termcolours=256
endif

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
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <C-L> <C-W><C-V>
nnoremap <C-J> :split<CR>
set splitbelow
set splitright

nnoremap <C-O> :NERDTreeToggle<CR>
nnoremap <C-F> :NERTreeFind<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
