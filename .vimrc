" Settings {{{

" Ensure the backspace key behaves normally 
set backspace=indent,eol,start

" Specify the internal and file encoding for Vim
set encoding=utf-8 fileencoding=utf-8

" Enable the terminal to support 256 colours
set t_Co=256

" Ask for confirmation when necessary
set confirm

" Enable mouse operations if available
set mouse=a

" Allow Vim to copy to clipboard
set clipboard=unnamed

" Enable file type detection
filetype on

" Enable file type-specific plugins 
filetype plugin on

" Intentation settings
" expandtab: convert tabs to spaces
" tabstop: how many spaces a tab is displayed as
" softtabstop: how many spaces a tab counts for
" shiftwidth: how much text shifts when indenting/unindenting
" Specify the global indentations settings
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
" Enable file type-specific indentation
filetype indent on
" Specify indentation settings for Shell scripts
autocmd FileType zsh,sh setlocal tabstop=2 shiftwidth=2 softtabstop=2
" Specify indentation settings for Python scripts
autocmd FileType py setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Enable syntax highlighting while keeping customised colours
syntax enable

" Show absolute and relative line number of the current line
set number relativenumber

" Highlight the current line 
set cursorline 

" Set the time for waiting time of sequential keyboard input
set ttimeoutlen=0

" Disable warpping for long lines
set nowrap

" Search settings
" ignorecase: ignore capitalised letters in searching
" hlsearch: highlight all matched cases
" incsearch: dynamically highlight matched cases
set ignorecase hlsearch incsearch

" Always show a status line even if there is only one window 
set laststatus=2

" Enable auto completion after pressing the tab key
set wildmenu wildmode=list:longest

" }}}


" Mappings {{{

" Set the leader key
let mapleader='\'

" Move between windows
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
inoremap <leader>j <esc><c-w>j
inoremap <leader>k <esc><c-w>k
inoremap <leader>h <esc><c-w>h
inoremap <leader>l <esc><c-w>l
vnoremap <leader>j <esc><c-w>j
vnoremap <leader>k <esc><c-w>k
vnoremap <leader>h <esc><c-w>h
vnoremap <leader>l <esc><c-w>l

" Clear the highlight of search results
nnoremap // :nohlsearch<cr>

" Adjust the window size
nnoremap <leader>= <c-w>+
nnoremap <leader>- <c-w>-
nnoremap <leader>, <c-w><
nnoremap <leader>. <c-w>>
inoremap <leader>= <c-w>+
inoremap <leader>- <c-w>-
inoremap <leader>, <c-w><
inoremap <leader>. <c-w>>
vnoremap <leader>= <c-w>+
vnoremap <leader>- <c-w>-
vnoremap <leader>, <c-w><
vnoremap <leader>. <c-w>>

" }}}


" Folding {{{

" zo: open current folding
" zc: close current folding
" zR: open all foldings
" zM: close all foldings
augroup filetype_vim
    autocmd!
    autocmd FileType vim,zsh,sh setlocal foldmethod=marker
    autocmd FileType python setlocal foldmethod=indent
augroup END

" }}}


" Plugins {{{
" 
" Vim plugins employed by vim-plug
" Use single quote: 'user/repo'
" Reload .vimrc, type :PlugInstall to install
" Type :PlugUpdate to update plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'               " Menu bar
Plug 'itchyny/lightline.vim'            " Status line
Plug 'NLKNguyen/papercolor-theme'       " Vim theme
Plug 'vim-python/python-syntax'         " Python syntax highlighter
Plug 'nathanaelkane/vim-indent-guides'  " Python indent guide
Plug 'davidhalter/jedi-vim'             " Python autocompletion
call plug#end()

" NERDTree: Menu bar
" Open NERDTree
nnoremap <leader>[ :NERDTree<cr>
" Close NERDTree
nnoremap <leader>] :NERDTreeClose<cr>
" Always show hidden files (toggle I)
let NERDTreeShowHidden=1
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" lightline.vim: Status line
" Path: ~/.Vim/plugged/lightline.vim/autoload/lightline/colorscheme
let g:lightline={'colorscheme':'one'}

" papercolor-theme: Vim theme
" Customised theme
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'folded_fg' : ['', '76'],
  \         'folded_bg' : ['', '234'],
  \         'color05' : ['', '248'],
  \         'color13' : ['', '120'],
  \         'search_bg' : ['', '184'],
  \         'incsearch_fg' : ['', '184'],
  \         'linenumber_fg' : ['', '248'],
  \         'linenumber_bg' : ['', '234'],
  \         'vertsplit_fg' : ['', '248'],
  \         'matchparen_bg' : ['', '111'],
  \         'cursorlinenr_fg' : ['', '255'],
  \         'cursorlinenr_bg' : ['', '234'],
  \       }
  \     }
  \   }
  \ }
set background=dark
colorscheme PaperColor

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" python-syntax
let g:python_highlight_all = 1

" jedi-vim
let g:jedi#goto_definitions_command = "D"

" }}}
