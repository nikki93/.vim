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
" file management
" ----------------------------------------------------------------------------

" nerdtree
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.o$', '\.meta$']
"let NERDTreeDirArrows = 0
let NERDTreeMinimalUI = 1
map <F11> :NERDTree<CR>:vertical resize 23<CR>

" ctrlp
Bundle 'kien/ctrlp.vim'
let g:ctrlp_extensions = ['tag', 'quickfix', 'line', 'changes', 'bookmarkdir']
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_map = ',f'
let g:ctrlp_working_path_mode = 0
nmap <Space> :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>t :CtrlPTag<CR>

" ----------------------------------------------------------------------------
" completion
" ----------------------------------------------------------------------------

" neocomplete
Bundle "Shougo/neocomplete"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cs = '.*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
set completeopt+=longest
set completeopt-=preview

" youcompleteme
"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_extra_conf_vim_data=['&filetype']
"let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
"nnoremap <C-w><C-\> :split<CR>:YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <C-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1 , 'cs': 1, 'ocaml': 1, 'java': 1 }

" omnisharp
Bundle "nosami/Omnisharp"
Bundle "tpope/vim-dispatch"

" jedi-vim
Bundle "davidhalter/jedi-vim"

" vaxe
Bundle 'jdonaldson/vaxe'

" ----------------------------------------------------------------------------
" coding
" ----------------------------------------------------------------------------

" --- completion -------------------------------------------------------------

" neocomplete
Bundle "Shougo/neocomplete"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cs = '.*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
set completeopt+=longest
set completeopt-=preview

" omnisharp
Bundle "nosami/Omnisharp"
Bundle "tpope/vim-dispatch"

" jedi-vim
Bundle "davidhalter/jedi-vim"

" vaxe
Bundle 'jdonaldson/vaxe'

" --- misc. ------------------------------------------------------------------

" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_ocaml_checkers = ['merlin']

" nerdcommenter
Bundle 'scrooloose/nerdcommenter'

" ----------------------------------------------------------------------------
" git
" ----------------------------------------------------------------------------

" gitgutter
Bundle 'airblade/vim-gitgutter'

" ----------------------------------------------------------------------------
" misc
" ----------------------------------------------------------------------------

" latex-box
Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"
let g:LatexBox_quickfix = 1
map <silent> <Leader>ls :silent
        \ !~/Applications/Skim.app/Contents/SharedSupport/displayline
        \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
        \ "%:p" <CR>

" vim-markdown
Bundle 'tpope/vim-markdown'

