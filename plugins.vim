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
"Bundle 'kien/ctrlp.vim'
"let g:ctrlp_extensions = ['tag', 'quickfix', 'line', 'changes', 'bookmarkdir']
"let g:ctrlp_match_window_reversed = 0
"let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
"let g:ctrlp_dotfiles = 0
"let g:ctrlp_map = ',f'
"let g:ctrlp_working_path_mode = 0
"nmap <Space> :CtrlP<CR>
"nmap <Leader>b :CtrlPBuffer<CR>
"nmap <Leader>t :CtrlPTag<CR>

" unite
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <Space> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap ,f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap ,r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap ,t :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap ,y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap ,b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-x>   <Plug>(unite_close)
endfunction

" ----------------------------------------------------------------------------
" coding
" ----------------------------------------------------------------------------

" --- completion -------------------------------------------------------------

" neocomplete
Bundle "Shougo/neocomplete"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.cs =
      \ '[^.]\.\%(\u\{2,}\)\?'

set completeopt+=longest
set completeopt-=preview

" clang_complete
"Bundle "Rip-Rip/clang_complete"
"let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 0

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

" exchange
Bundle 'tommcdo/vim-exchange'

