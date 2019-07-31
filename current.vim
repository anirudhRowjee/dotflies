"""""""""
" my current .vimrc - for systems with git access
" Simple VIM IDE for python (kinda?)
" maintained by Anirudh Rowjee (github @anirudhRowjee)
"""""""""



syntax on
" Vim Plugins - with Vim-Plug

call plug#begin('~/.vim/bundle')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'raimondi/delimitmate'
Plug 'junegunn/goyo.vim'
" Autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-janah'
Plug 'FrancescoMagliocco/CmptrClr'
Plug 'KabbAmine/yowish.vim'	
Plug 'cohlin/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
" framework support
Plug 'jmcomets/vim-pony'
Plug 'tweekmonster/django-plus.vim'
Plug 'mattn/emmet-vim'
" file handling
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'

call plug#end()


" config for plugins
let g:python_highlight_all = 1

set nocompatible
filetype plugin on
syntax on
syntax enable
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

" split separators - make the lines disappear
set fillchars+=vert:\ 

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

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

set background=dark
colorscheme PaperColor
" Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_adwaita'

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif


function! StartWork()
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
