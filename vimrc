""" Environment
if has("win16") || has("win32")
    " We start under vimfiles, so get the full path then the 2 parents
    let $VIMHOME=expand('<sfile>:p:h:h')
    let $VIMDIR = $VIMHOME.'\vimfiles'
else
    let $VIMHOME=$HOME
    let $VIMDIR = $VIMHOME.'/.vim'
endif

""" Encodings!
scriptencoding utf-8
set encoding=utf-8

""" System settings
if has("unix")
  set shell=bash
elseif has("win16") || has("win32")
  " Leave shell alone!
else
  set shell=ksh.exe
endif
let mapleader=","   " Set <Leader>

" Set filetype stuff to on
filetype on
filetype plugin indent on
syntax on
let c_space_errors = 1
" Set up artistic style
" au BufNewFile,BufRead *.cpp set formatprg=astyle\ -A1s4pxkCNwYfUxek1jcxC80xL
" au BufNewFile,BufRead *.c set formatprg=astyle\ -A1s4pwYfUxek1jcxC80xL
" au BufNewFile,BufRead *.h set formatprg=astyle\ -A1s4pxkCNwYfUxek1jcxC80xL
au BufNewFile,BufRead */etc/nagios/*.cfg,*/nagios/etc/*.cfg,*sample-config/template-object/*.cfg{,.in},/var/lib/nagios/objects.cache set ft=nagios
" Whitespace
autocmd BufWritePre * StripWhitespace

""" Color stuff
if has("gui_running")
    colorscheme torte
endif
hi MatchParen term=bold guibg=#444444 guifg=#eeeeee ctermbg=242

""" General
set hidden                     " allow hiding of buffers without saving (sanity)
set nobackup                   " no backup files
set nowritebackup              " only in case you don't want a backup file while editing
set noswapfile                 " no swap files
set guioptions-=r              " Disable scrollbar, menubar, toolbar
set guioptions-=m
set guioptions-=T
set vb                         " Visual Bell instead of sound
set lazyredraw                 " Don't redraw the screen when playing macros
set backspace=indent,eol,start " All the nice backspaces
set mousehide                  " Hide mouse when typing
set wildmenu                   " Super awesome tab completion
set wildcharm=<C-z>            " Character used for popping menu in macros
set noignorecase               " Respect case when searching
set sw=4                       " Set shiftwidth (<< >>)
set ts=4                       " Set tabstop
set softtabstop=4              " Size of tabs in INSERT mode
set expandtab                  " Tabs suck
set mouse=""                   " Mice suck
set nocp                       " Compatibility sucks
set autoindent                 " Copy indent from preceeding line
set nowrap                     " Turn off wrapping
set sidescroll=5               " Make horiz moves useful
set cpoptions+=ces$            " Show $ when doing things like cw
set timeoutlen=500             " Half-second command timeout
set number                     " Let's use line number to speed up movement
set relativenumber             " Relative numbering seems to be awesome!
if has("gui_running") && (has("win16") || has("win32"))
    set columns=90 lines=40    " Set standard gui window size for gVim
endif
" Set up detection of unwanted characters
set list
set listchars=tab:>-                " Show tab characters as super ugly
set listchars+=precedes:<,extends:> " Show characters in first/last columns
set history=100                     " Keep some stuff in the history
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8
" Set up formatoptions
set formatoptions+=tqc
if v:version > 703
    set formatoptions+=j
endif
" Highlight searches and set hi color
set hlsearch
hi Search guibg=Yellow
" Disable highlighting on startup
set viminfo^=h
" Turn on plugin docs
if has("win16") || has("win32")
    helptags $VIMHOME/vimfiles/doc
else
    helptags $VIMHOME/.vim/doc
endif
" Source tags from local sources
set tags+="$VIMDIR/tags/**/tags"

" Enable match-it plugin to match all kinds of wonderful things
runtime macros/matchit.vim

" Enable pathogen
execute pathogen#infect()

""" Source modular configs
for f in split(glob("$VIMDIR/config/*.vim"), '\n')
    exe 'source' f
endfor

""" Plugin-specific options
" WebDevIcons
let g:webdevicons_enable = 1

" ShowMarks
" Remove silly marks
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`"
highlight ShowMarksHLl guifg=white guibg=darkgreen
highlight ShowMarksHLu guifg=white guibg=darkblue
highlight ShowMarksHLo guifg=white guibg=purple
" Change sign column hilight
highlight SignColumn guibg=#204050

" Set up cscope in Windows
if has("win16") || has("win32")
    set csprg=$VIMDIR/utils/cscope.exe
endif
" Source CScope databases
set nocscopeverbose
for f in split(glob("$VIMDIR/tags/*.cscope"), '\n')
    exe 'cscope add' f
endfor
