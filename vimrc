""" Encodings!
scriptencoding utf-8
set encoding=utf-8
" Enable pathogen
execute pathogen#infect()
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
""" System settings
if has("unix")
  set shell=bash
elseif has("win16") || has("win32")
  " Leave shell alone!
else
  set shell=ksh.exe
endif

""" Programming
" Set filetype stuff to on
filetype on
filetype plugin indent on
syntax on
let c_space_errors = 1
" Set up artistic style
au BufNewFile,BufRead *.cpp set formatprg=astyle\ -A1s4pxkCNwYfUxek1jcxC80xL
au BufNewFile,BufRead *.c set formatprg=astyle\ -A1s4pwYfUxek1jcxC80xL
au BufNewFile,BufRead *.h set formatprg=astyle\ -A1s4pxkCNwYfUxek1jcxC80xL
au BufNewFile,BufRead */etc/nagios/*.cfg,*/nagios/etc/*.cfg,*sample-config/template-object/*.cfg{,.in},/var/lib/nagios/objects.cache set ft=nagios
" Get rid of automatic comment insertion
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" Color stuff
if has("gui_running")
    colorscheme torte
endif
hi MatchParen term=bold guibg=#444444 guifg=#eeeeee ctermbg=242

""" Font stuff
if has("mac")
  let g:main_font = "Inconsolata:h13"
  let g:small_font = "Inconsolata:h10"
elseif has("win16") || has("win32")
  set gfn=Sauce_Code_Powerline:h11,Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
  set shell=/bin/bash
  set gfn=Source\ Code\ Pro:h11,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
  set gfn=Monospace\ 11
endif

""" General
set guioptions-=r   " Disable scrollbar
set guioptions-=m   " Disable menubar
set guioptions-=T   " Disable toolbar
set vb              " Visual Bell instead of sound
set backspace=2     " All the nice backspaces
set mousehide       " Hide mouse when typing
set wildmenu        " Super awesome tab completion
set noignorecase
set sw=4
set ts=4
set softtabstop=4
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
set relativenumber  " Relative numbering seems to be awesome!
" Just map Z to save files
nnoremap Z         :w<CR>
" Next Buffer
nnoremap <Leader>x :bn<CR>
" Prev Buffer
nnoremap <Leader>z :bp<CR>
" Del Buffer (bbye: Leave Window)
nnoremap <Leader>bd :Bdelete<CR>
" Remap for splitting lines
nnoremap K i<CR><Esc>
" Remap for destroying trailing whitespace cleanly
nnoremap <Leader>w :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>
nnoremap <Leader>u :GundoToggle<CR>

set history=100     " Keep some stuff in the history
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" StatusLine
set laststatus=2
" Custom color changes
" hi StatusLineFName ctermfg=15 ctermbg=0 guifg=White guibg=Black
" set stl=%#StatusLineFName# " todo highlight
" set stl+=%t                " filename
" set stl+=%m                " edited?
" set stl+=%*                " clear highlight
" set stl+=\                 " Sep
" set stl+=Line:%l/%L        " Line no
" set stl+=\                 " Sep
" set stl+=[%p%%]            " Line pct in file
" set stl+=%<                " Collapse
" set stl+=\                 " Sep
" set stl+=Col:%v            " Column
" set stl+=%=                " Right align
" set stl+=Buf:#%-2n         " Buf number
" set stl+=[%3b][0x%02B]     " Char codes
" hi StatusLine ctermfg=5 ctermbg=0 guibg=#222222 guifg=#AA66CC term=bold cterm=bold gui=bold
" hi StatusLineNC ctermfg=7 ctermbg=0 guibg=#555555 guifg=#AAAAAA term=bold cterm=bold gui=bold

" Highlight searches and set hi color
set hlsearch
hi Search guibg=Yellow
" noh with Return
nnoremap <CR> :nohlsearch<CR><CR>
" Disable highlighting on startup
set viminfo^=h
" Turn on plugin docs
if has("unix")
    helptags ~/.vim/doc
elseif has("win16") || has("win32")
    helptags ~/vimfiles/doc
endif
" Enable match-it plugin to match all kinds of wonderful things
runtime macros/matchit.vim

" Edit the vimrc file
if has("unix")
    nnoremap <Leader>ev :arge $MYVIMRC<CR>
    nnoremap <Leader>sv :source $MYVIMRC<CR>
elseif has("win16") || has("win32")
    nnoremap <Leader>ev :arge ~/vimfiles/vimrc<CR>
    nnoremap <Leader>sv :source ~/vimfiles/vimrc<CR>
endif

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

" Syntastic
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_checkers = ["clang_check", "clang_tidy"]
let g:syntastic_cpp_remove_include_errors = 1
if has("freebsd")
  let g:syntastic_shell = bash
endif

" Ctrl-P
" Use regex mode by default
let g:ctrlp_regexp = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" WebDevIcons
let g:webdevicons_enable = 1

" Rainbow Parentheses
let g:rainbow_active = 1 " :RainbowToggle toggles it
let g:rainbow_conf = {
    \   'guifgs': ['white', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" YankRing
" Min to save is 2 characters
let g:yankring_min_element_length = 2
" Manage the numbered yank registers
let g:yankring_manage_numbered_reg = 1
