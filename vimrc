colorscheme torte
set sw=4
set ts=4
set expandtab
set nocp
set smartindent
syntax on
" Set <Leader>
let mapleader=","
" Turn off wrapping, and make horiz moves useful
set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>
set mouse=""

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
