" Settings  ---------------------------------------{{{ 

" Ensure the Backspace key behaves normally in insert mode
set backspace=indent,eol,start

" Set the internal encoding of Vim to UTF-8 
set encoding=utf-8 

" Set the encoding of current file to UTF-8
set fileencoding=utf-8

" Enable terminal to support 256 colours
set t_Co=256

" Enable file type detection
filetype on

" Enable plugins and load plugins for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Enable syntax highlight
syntax on
syntax enable

" Toggle line numbers on the left-hand side
set number

" Show relative line numbers from the cursor's line
set relativenumber

" Highlight the row of current cursor 
set cursorline

" Set the time for waiting time of sequential keyboard input
set ttimeoutlen=0

" Set colour scheme for cursorline
hi cursorline cterm=none ctermbg=none ctermfg=none

" Set colour scheme for line number of the current cursor
hi cursorlinenr cterm=none ctermbg=yellow ctermfg=red

" Highlight the column of current cursor
" set cursorcolumn

" Global indentation settings
" Set how many spaces a tab is displayed as
set tabstop=4
" Set how many spaces are inserted when pressing a tab
set softtabstop=4
" Set how many spaces for each level of indentation
set shiftwidth=4
" Convert a tab into spaces
set expandtab

" Zsh/Bash indentation settings
autocmd FileType zsh setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Disable warpping for long lines
set nowrap

" Ignore capitalise letters during search
set ignorecase

" Highlight all matched cases, use ':noh' to clear
set hlsearch

" Highlight dynamically when matching
set incsearch

" Always show a status line even if there is only one window 
set laststatus=2

" Enable mouse operation if available
set mouse=a

" Enable auto completion after pressing Tab
set wildmenu

" Adust the auto completion acting like normal completion in zsh
set wildmode=list:longest

" Ask for confirmation when necessary (e.g. quit unsaved file)
set confirm

" }}}


" Mappings ---------------------------------------{{{ 
              
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

" Switch to the normal mode
inoremap <leader><leader> <esc>
vnoremap <leader><leader> <esc>

" Save the current file
nnoremap <leader>s :w<cr>
inoremap <leader>s <esc>:w<cr>
vnoremap <leader>s <esc>:w<cr>

" }}}


" Statusline ---------------------------------------{{{

" Clear status line when .vimrc is reloaded
set noshowmode                                  " remove vim mode at bottom
set statusline=
set statusline+=%r\                             " read-only flag
set statusline+=%{StatuslineMode()}             " vim mode
set statusline+=%{b:gitbranch}                  " git branch
set statusline+=%F                              " long term path
set statusline+=\ %m                            " modifing flag
set statusline+=%=
set statusline+=B\:%n/%{TotalBufferNum()}       " curr_buf_num/total_buf_num
set statusline+=\ W\:%{winnr()}/%{winnr('$')}   " curr_win_num/total_win_num
set statusline+=\ T\:%{tabpagenr()}/%{tabpagenr('$')}
set statusline+=\ R\:%l                         " curr_row_num/total_row_num
set statusline+=/
set statusline+=%L                            
set statusline+=\ C\:%c/%{strlen(getline('.'))} " curr_lin_num/total_lin_num
set statusline+=\ P:%p/100\                     " curr_perc/total_perc

" Get total buffer numbers
function! TotalBufferNum()
  return lezcn(getbufinfo({'buflisted': 1}))
endfunction

" Get Git branch information
function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

" Get Vim mode
function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "Normal "
  elseif l:mode==?"v"
    return "Visual "
  elseif l:mode==#"i"
    return "Insert "
  elseif l:mode==#"R"
    return "Replace "
  elseif l:mode==?"s"
    return "Select "
  elseif l:mode==#"t"
    return "Terminal "
  elseif l:mode==#"c"
    return "Command "
  elseif l:mode==#"!"
    return "Shell "
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

" }}}


" Folding ---------------------------------------{{{

" zo: open current folding
" zc: close current folding
" zR: open all folding
" zM: close all folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType zsh setlocal foldmethod=marker
    autocmd FileType python setlocal foldmethod=indent  " fold .py files based on indent
augroup ENDi

" }}}


" Plugin ---------------------------------------{{{
" 
" Vim plugins employed by vim-plug
" Use single quote: 'user/repo'
" Reload .vimrc, type :PlugInstall to install
" Type :PlugUpdate to update plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'           " Menu bar
Plug 'itchyny/lightline.vim'        " Status line
Plug 'NLKNguyen/papercolor-theme'   " Theme
Plug 'vim-python/python-syntax'     " Python syntax highlight
Plug 'ervandew/supertab'            " Auto-completion
call plug#end()

" NERDTree
" Open NERDTree
nnoremap <leader>[ :NERDTree<cr>
" Close NERDTree
nnoremap <leader>] :NERDTreeClose<cr>
" Always show hidden files (toggle I)
let NERDTreeShowHidden=1
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" lightline.vim
let g:lightline={'colorscheme':'deus'}

" papercolor-theme
set background=dark
colorscheme PaperColor

" python-syntax
let g:python_highlight_all = 1

" }}}
