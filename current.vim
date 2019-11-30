"""""""
" vim config for machines with git
" maintained by Anirudh Rowjee (github @anirudhRowjee)
"""""""


" ------------- PLUGINS SETUP ----------------"
call plug#begin('~/.vim/plugged')

" GUI and UI plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dense-analysis/ale'
" Autocomplete
Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
" framework support
Plug 'jmcomets/vim-pony'
Plug 'tweekmonster/django-plus.vim'
Plug 'mattn/emmet-vim'
" file handling
Plug 'tpope/vim-vinegar'
" colors
Plug 'xdg/vim-darkluma'
Plug 'fielding/vice'
Plug 'plainfingers/black_is_the_color'
Plug 'wdhg/dragon-energy'
Plug 'alexkh/vimcolors' "SV
Plug 'morhetz/gruvbox'
call plug#end()
"-------------------------------------------"


set nocompatible
syntax on
set nowrap
set encoding=utf-8
set guifont=consolas

" Show linenumbers
set number
set relativenumber
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" wrap at 80 characters
set textwidth=80

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

colo vice
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
set clipboard=unnamedplus

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
set path +=$PWD/

" display all matching files
set wildmenu

" execute python file on pressing f5
map <F5> :w<CR>:exe ":!python3 " . getreg("%") . "" <CR>

" map ctrl-n to create new file and open in edit
map <C-n> :call Cbdo() <CR> 

" map ctrl-r to open terminal and file explorer
map <C-r> :call StartWork() <CR>

" set working directory to wherever the open file lives
"set autochdir

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" omnicompletion settings
autocmd CompleteDone * pclose

" python specific buffer settings?
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Plugin Config - ALE
let g:ale_linters = {'python': ['flake8']}

" Plugin Config - FZF
nnoremap <c-p> :FZF <CR>

" backspace config
set backspace=indent,eol,start


