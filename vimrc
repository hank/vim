""" Programming
" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on
syntax on
let c_space_errors = 1
" Set up artistic style
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -A1s4pxkCNwYfUxek1jcxC80xL
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -A1s4pwYfUxek1jcxC80xL
autocmd BufNewFile,BufRead *.h set formatprg=astyle\ -A1s4pxkCNwYfUxek1jcxC80xL

""" Color stuff
colorscheme torte
hi MatchParen term=bold guibg=#444444 guifg=#eeeeee ctermbg=242

""" Font stuff
if has("mac")
  let g:main_font = "Inconsolata:h13"
  let g:small_font = "Inconsolata:h10"
endif

""" General
set guioptions-=r   " Disable scrollbar
set vb              " Visual Bell instead of sound
set backspace=2     " All the nice backspaces
set mousehide       " Hide mouse when typing
set wildmenu        " Super awesome tab completion
set noignorecase
set sw=4
set ts=4
set expandtab       " Tabs suck
set mouse=""        " Mice suck
set nocp
set autoindent
set smartindent
let mapleader=","   " Set <Leader>
" Turn off wrapping, and make horiz moves useful
set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>
set cpoptions+=ces$  " Show $ when doing things like cw
set timeoutlen=500  " Half-second command timeout
set number          " Let's use line number to speed up movement
nnoremap <Leader>x :bn<CR> " Next Buffer
nnoremap <Leader>z :bp<CR> " Prev Buffer
nnoremap <Leader>bd :Bdelete<CR> " Del Buffer (bbye: Leave Window)

nnoremap K i<CR><Esc> " Remap for splitting lines

set history=100     " Keep some stuff in the history
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" StatusLine
" Custom color changes
hi StatusLineFName ctermfg=0 ctermbg=14 guifg=White guibg=Black
set stl=%#StatusLineFName# " todo highlight
set stl+=%t                " filename
set stl+=%m                " edited?
set stl+=%*                " clear highlight
set stl+=\                 " Sep
set stl+=Line:%l/%L        " Line no
set stl+=\                 " Sep
set stl+=[%p%%]            " Line pct in file
set stl+=%<                " Collapse
set stl+=\                 " Sep
set stl+=Col:%v            " Column
set stl+=%=                " Right align
set stl+=Buf:#%-2n         " Buf number
set stl+=[%3b][0x%02B]     " Char codes
hi StatusLine guibg=#222222 guifg=#AA66CC term=bold cterm=bold gui=bold
hi StatusLineNC guibg=#555555 guifg=#AAAAAA term=bold cterm=bold gui=bold

" Highlight searches and set hi color
set hlsearch
hi Search guibg=Yellow
" noh with Return
nnoremap <CR> :nohlsearch<CR><CR>
" Disable highlighting on startup
set viminfo^=h
" Turn on plugin docs
helptags ~/.vim/doc
" Enable match-it plugin to match all kinds of wonderful things
runtime macros/matchit.vim
" LycosaExplorer recommends this
set hidden


" set the forward slash to be the slash of note.  Backslashes suck
set shellslash
if has("unix")
  set shell=zsh
else
  set shell=ksh.exe
endif

" Edit the vimrc file
nnoremap <Leader>ev :e ~/.vim/vimrc<CR>
nnoremap <Leader>sv :source ~/.vim/vimrc<CR>

""" Functions/Commands
""" TODO: Beef this up at work
function! MaybeRunMakeTags()
  let root = FindCodeDirOrRoot()
  if root != "/"
    call system("cd " . root . "; ~/bin/maketags &")
  endif
endfunction

" Set up detection of unwanted characters
set list
set listchars=tab:>-,trail:·

" Vim. Live it.
nnoremap <up> <nop>
inoremap <up> <nop>
vnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <right> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
" B A <start>
" :: HJKL 4EVA. ::

let NERDTreeHijackNetrw=1
let NERDTreeMouseMode=0
nnoremap <Leader>nt :NERDTree<CR>
