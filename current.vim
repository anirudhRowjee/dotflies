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
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Autocomplete and syntax highlighting
Plug 'sheerun/vim-polyglot'
"Plug 'valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" framework support
Plug 'mattn/emmet-vim'
" file handling
Plug 'tpope/vim-vinegar'
" colors
Plug 'fielding/vice'
Plug 'tjammer/focusedpanic.vim'
Plug 'jdsimcoe/hyper.vim'
Plug 'atahabaki/archman-vim'
" LaTeX setup
Plug 'vim-latex/vim-latex'
call plug#end()
"-------------------------------------------"


set nocompatible
syntax on
set nowrap
set encoding=utf-8

" Show linenumbers
set number
set relativenumber
set ruler

" Set Proper Tabs
set tabstop=4 shiftwidth=4
set smarttab

" wrap at 80 characters
set textwidth=150

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline!

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_theme_background='dark'

colo archman
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
autocmd BufEnter *.py set textwidth=80

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
" let g:ycm_python_binary_path = 'python'

" python specific buffer settings?
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" web development stuff
autocmd BufEnter,BufRead *.js,*.vue,*.ts,*.html,*.css set tabstop=2 shiftwidth=2 foldmethod=syntax
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead,BufEnter *.md set textwidth=100

" Plugin Config - ALE
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint'],}
let g:ale_python_executable='/usr/bin/python3'
let g:ale_sign_error='❌'
let g:ale_sign_warning='⚠️'
let g:ale_set_highlights=0
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:airline#extensions#ale#enabled = 1

" Plugin Config - FZF
nnoremap <c-p> :Files <CR>
nnoremap <c-b> :BTags <CR>

" backspace config
set backspace=indent,eol,start

" vim latex settings
autocmd BufWritePost *.tex normal \ll
autocmd BufEnter *.tex normal \lv\ll
autocmd BufEnter *.tex set textwidth=80

" vim-latex config
let g:Tex_ViewRule_pdf = 'zathura'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex $*'

" transparent background for vim
hi Normal guibg=NONE ctermbg=NONE

" FZF config
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.3}, }
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ''

" coc.nvim completion config
set hidden
set updatetime=300
set updatetime=300
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


let g:airline#extensions#hunks#enabled=0
