" ',' leader (do this early)
let g:mapleader=","

" per-directory config
set exrc
set secure

" blender autocomplete
if has('python')
py << EOF
import sys
sys.path.insert(0, '/Users/nikki/Development/bge-api')
EOF
endif


" plugins (do this early)
source ~/.vim/plugins.vim

" ui
" set guifont=Menlo Regular:h11
set transparency=10
set guioptions=
set ignorecase
set nowrap
set incsearch
set nocompatible
" set colorcolumn=80
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
map <F10> :make -C ./Build -j5 CXX="ccache g++" config=debug
map <F12> :make -C ./Build -j5 CXX="ccache g++" config=release

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
au BufRead,BufNewFile *.angelscript set syntax=cpp "angelscript

" ocaml merlin, ocp-indent
set rtp+=~/.opam/system/share/ocamlmerlin/vim
set rtp+=~/.opam/system/share/ocamlmerlin/vimbufsync
autocmd FileType ocaml source /Users/nikki/.opam/system/share/typerex/ocp-indent/ocp-indent.vim

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" color only bad column
call matchadd('ColorColumn', '\%81v', 100)

