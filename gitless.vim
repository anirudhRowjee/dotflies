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
   set autochdir
   call inputsave()
   let name=input('enter filename >>')
   call inputrestore()
   vs
   wincmd w
   execute 'e' name
   set autochdir!
endfunction

" term - open terminal in local dir
function! Term()
    set autochdir
    term
    set autochdir!
endfunction    

" Theme and Styling 

if (has("termguicolors"))
  set termguicolors
endif
set t_Co=256


" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif


" Turn Vim into an IDE
function! StartWork()
    split
    wincmd w
    call Term()
    wincmd w
    q
    wincmd w
    resize +8
    vs
    Explore
    vertical resize -50
endfunction

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

" toggle left file explorer
map <C-t> :Lex <CR>

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

" map ctrl-r to open terminal and file explorer
map <C-r> :call StartWork() <CR>

" set working directory to wherever the open file lives
"set autochdir

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

hi clear
set background=dark
if exists("syntax_on")
syntax reset
endif
let g:colors_name = "sv"

highlight Comment ctermfg=green guifg=green
hi NonText guifg=brown

highlight Constant ctermfg=14 cterm=none guifg=#0077ff gui=none
highlight cString guifg=white gui=bold ctermfg=white cterm=bold
highlight cCppString guifg=white gui=bold ctermfg=white cterm=bold
highlight cBracket guibg=red gui=bold ctermbg=red cterm=bold

highlight Identifier guifg=#00c0c0 ctermfg=cyan
highlight Statement ctermfg=3 cterm=bold guifg=#c0c000 gui=bold
highlight PreProc ctermfg=lightblue guifg=#0088ff
highlight Type ctermfg=2 guifg=orange
highlight Special ctermfg=12 guifg=#bb00bb gui=bold
highlight Error ctermbg=9 guibg=#ff0000
highlight Todo ctermfg=4 ctermbg=3 guifg=#000080 guibg=#c0c000
highlight Directory ctermfg=2 guifg=#00c000
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Normal guifg=#cccc66 guibg=#000000 ctermfg=darkyellow
highlight Search ctermbg=3 guibg=#c0c000
hi operator guifg=pink
hi statement guifg=red ctermfg=red

hi DiffChange guibg=darkgreen
hi DiffText guibg=olivedrab
hi DiffAdd guibg=slateblue
hi DiffDelete guibg=coral 


