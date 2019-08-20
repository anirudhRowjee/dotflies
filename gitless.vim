"""""""
" basic .vimrc for machines without git support 
" best vanilla config
" maintained by Anirudh Rowjee (github @anirudhRowjee)
"""""""


set nocompatible
syntax on
set nowrap
set encoding=utf-8
set guifont=consolas

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

" netrw - create file and open in new split
function! Cbdo()
   call inputsave()
   let name=input('enter filename >>')
   call inputrestore()
   vs
   wincmd w
   execute 'e' name
endfunction

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

" GVIM specifc config
au GUIEnter * simalt ~x


set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" python compatibility
filetype plugin on  
set omnifunc=syntaxcomplete#Complete 

" indentation-based folding
set foldmethod=indent
set foldlevel=99

" map space to za (fold/unfold)
nnoremap <space> za

" syntax marking for python (may not work)
let python_highlight_all=1

" set to system clipboard
set clipboard=unnamed

" cursorline
set cursorline

" move indent when enter is pressed
set autoindent

" show matching brackets
set showmatch

" searching
set incsearch
set hlsearch

" key binding to turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" path for fuzzy find
set path +=**

" display all matching files
set wildmenu

" execute python file on pressing f5
map <F5> :w<CR>:exe ":!python " . getreg("%") . "" <CR>

" map ctrl-n to create new file and open in edit
map <C-n> :call Cbdo() <CR> 
