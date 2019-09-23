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
set path +=$PWD/

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

" omnicompletion settings
autocmd CompleteDone * pclose

" ------------------------------------------------------------------------------
"                                  by wdhg
" ------------------------------------------------------------------------------

set background=dark
hi clear

if exists("syntax_on")
  "syntax clear
  "syntax on
  syntax reset
endif


" ------------------------------------------------------------------------------
"                                    code
" ------------------------------------------------------------------------------

hi Comment         guifg=#eeee44

hi Constant        guifg=#f07040
hi String          guifg=#90fe40
hi Character       guifg=#00dd55
hi Number          guifg=#11ccff
"Boolean
hi Float           guifg=#11ccff

hi Identifier      guifg=#29d8f7
hi Function        guifg=#fe88fe

hi Statement       guifg=#ff4477
"Conditional
"Repeat
"Label
"Operator
"Keyword
"Exception

hi PreProc         guifg=#ee9933
"Include
"Define
"Macro
"PreCondit

hi Type            guifg=#33ddc8
"StorageClass
"Structure
"Typedef

hi Special         guifg=#ffb030
"SpecialChar
"Tag
"Delimiter
"SpecialComment
"Debug

"Underlined

"Ignore

hi Error           guifg=#ffffff       guibg=#ff0000

hi Todo            guifg=#000000       guibg=#eeee44

" ------------------------------------------------------------------------------
"                                   editor
" ------------------------------------------------------------------------------

hi ColorColumn                         guibg=#222222
"Conceal
hi Cursor                              guibg=#ff00ff
"CursorIM
"CursorColumn
hi CursorLine                          guibg=#303030
"Directory
"DiffAdd
"DiffChange
"DiffDelete
"DiffText
"ErrorMsg
"VertSplit
"Folded
"FoldColumn
"SignColumn
"IncSearch
hi LineNr          guifg=#aaaa66
hi MatchParen      guifg=#000000       guibg=#ffff00
"ModeMsg
"MoreMsg
"NonText
hi Normal          guifg=#ffffff       guibg=#000000
"Pmenu
"PmenuSel
"PmenuSbar
"PmenuThumb
"Question
"Search
"SpecialKey
"SpellBad
"SpellCap
"SpellLocal
"SpellRare
"StatusLine
"StatusLineNC
"TabLine
"TabLineFill
"TabLineSel
"Title
"Visual
"VisualNOS
"WarningMsg
hi Whitespace      guifg=#555555
"WildMenu

