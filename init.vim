call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-gitgutter'

Plug 'honza/vim-snippets'

Plug 'MattesGroeger/vim-bookmarks'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'KabbAmine/zeavim.vim', {'on' : ['ZeaVim', '<Plug>Zeavim']}
Plug 'mattn/gist-vim'
Plug 'mattn/emmet-vim'
Plug 'reedes/vim-wordy'
Plug 'klen/python-mode'
Plug 'tpope/vim-speeddating'

" Add plugins to &runtimepath
call plug#end()


" automatic reloading of vimrc
autocmd! bufwritepost init.vim source %

set ruler
syntax on
set showcmd
filetype plugin indent on
set hlsearch
filetype plugin on

" Quick saves
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" no need to use <shift> to type :
nnoremap ; :
nnoremap : ;

" remapping esapce key
inoremap jj <Esc>

" Showing line numbers and length set number
set tw=79
set nowrap
set fo-=t
set number
set laststatus=2

" --- Column/Row stuff ---"
set cul
" set lines=40 columns=120   "window size

set colorcolumn=80
highlight ColorColumn ctermbg=blue guibg=#cc0000
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%121v',100)


set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" set expandtab "only for blender python
set smarttab

" auto -complete
set ofu=syntaxcomplete#Complete

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

set history=9000
set undolevels=9000
set spelllang=en_gb
set spellsuggest=best,6
set spellfile=~/.config/nvim/dict.krv.utf-8.add
set dictionary+=/usr/share/dict/words,
set dictionary+=/usr/share/dict/british-english
set dictionary+=/usr/share/dict/connectives.gz
set dictionary+=/usr/share/dict/web2,
set dictionary+=/usr/share/dict/web2a.gz
set dictionary+=/usr/share/dict/propernames.gz

