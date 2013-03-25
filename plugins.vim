" ----------------------------------------------------------------------------
" vundle
" ----------------------------------------------------------------------------
"
" Brief help
"     :BundleList          - list configured bundles
"     :BundleInstall(!)    - install (update) bundles
"     :BundleSearch(!) foo - search (or refresh cache first) for foo
"     :BundleClean(!)      - confirm (or auto-approve) removal of 
"                            unused bundles
"    
"     see :h vundle for more details or wiki for FAQ
"
" ----------------------------------------------------------------------------

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" ----------------------------------------------------------------------------
" bundles
" ----------------------------------------------------------------------------

" minibufexpl
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1

" nerdtree
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.o$']
let NERDTreeDirArrows=0
map <F11> :NERDTree<CR> :vertical resize 23<CR>

" ctrlp
Bundle 'kien/ctrlp.vim'
let g:ctrlp_extensions = ['tag', 'quickfix', 'line', 'changes', 'bookmarkdir']
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_map = ',f'
nmap ; :CtrlPBuffer<CR>
nmap ,t :CtrlPTag<CR>

" clang_complete
Bundle 'Rip-Rip/clang_complete'

" supertab
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<C-x><C-o>"
let g:SuperTabLongestEnhanced=1

" syntastic
Bundle 'scrooloose/syntastic'
