set nocompatible
syntax on
set nowrap
set encoding=UTF-8
set guifont=consolas\ Nerd\ Font\ 10

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline


" NetRW configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 10
let g:netrw_altv = 2

" Theme and Styling 

if (has("termguicolors"))
  set termguicolors
endif
colorscheme industry 


" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif


function StartWork()
    below term
    wincmd w    
    resize +8
    vs
    Explore
    vertical resize -50
endfunction

" Custom mappings for easy startup
autocmd VimEnter * call StartWork()
