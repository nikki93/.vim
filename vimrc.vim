" ',' leader (do this early)
let g:mapleader=","

" per-directory config
set exrc
set secure


" plugins (do this early)
source ~/.vim/plugins.vim

" ui
set guifont=Mensch\ 9
set guioptions=
set ignorecase
set nowrap
set incsearch
set nocompatible
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" code
filetype plugin on
filetype plugin indent on
syntax on
set completeopt=longest,menuone,preview
set sw=4
"set tw=69
set expandtab
set cindent
set fdm=marker
set fmr={{{,}}}

" maps

map k gk
map j gj

map <F1>  :bprevious<CR>
map <C-p> :bprevious<CR>
map <F2>  :bnext<CR>
map <C-n> :bnext<CR>
map <C-x> :bp<CR>:bd #<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-e> :vert split<CR>
map <C-a> :split<CR>

nnoremap <C-i> <C-o>
nnoremap <C-o> <Tab>

map <C-CR> :!urxvt &<CR><CR>
map <F10> :make -j5 CXX="ccache g++" config=debug
map <F12> :make -j5 CXX="ccache g++" config=release

map <Leader>p :set tags+=~/Development/Tags/

noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" keyboard menu
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

" colorscheme (set after loading colors plugin)
set background=dark
colors hemisu

" syntax
au BufRead,BufNewFile *.as set syntax=cpp "angelscript
