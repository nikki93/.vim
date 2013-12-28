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
let NERDTreeIgnore = ['\.o$', '\.meta$', '\.class$', '^__eclim_temp_']
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
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <Space> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
nnoremap ,f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap ,r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap ,t :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap ,y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap ,b :<C-u>Unite -no-split -buffer-name=buffer  -quick-match buffer<cr>
nnoremap ,g :<C-u>Unite -no-split -buffer-name=ag  grep<cr>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
    \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

" custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <C-l>   <Plug>(unite_redraw)
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
let g:neocomplete#force_omni_input_patterns.cs =
      \ '[^.]\.\%(\u\{2,}\)\?'
let g:neocomplete#force_omni_input_patterns.java =
      \ '\%(\h\w*\|)\)\.\w*'
let g:neocomplete#force_omni_input_patterns.python =
      \ '\%(\h\w*\|)\)\.\w*'

" clang_complete
Bundle "Rip-Rip/clang_complete"
let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'

" omnisharp
Bundle "nosami/Omnisharp"
Bundle "tpope/vim-dispatch"

" jedi-vim
Bundle "davidhalter/jedi-vim"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0

" vaxe
Bundle 'jdonaldson/vaxe'

" --- snippets ---------------------------------------------------------------

Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-h>"

" --- misc. ------------------------------------------------------------------

" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -I/usr/local/include/SDL2'
let g:syntastic_cpp_config_file = '.clang_complete'

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

" glsl
Bundle 'tikhomirov/vim-glsl'

" exchange
Bundle 'tommcdo/vim-exchange'

" ----------------------------------------------------------------------------
" post-config
" ----------------------------------------------------------------------------

set completeopt+=longest
set completeopt-=preview

