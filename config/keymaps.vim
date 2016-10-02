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

" Edit the vimrc file and config plugins
if has("unix")
    nnoremap <Leader>ev :arge $MYVIMRC<CR>
    nnoremap <Leader>ec :arge $VIMDIR/config/<C-z><S-Tab>
    nnoremap <Leader>sv :source $MYVIMRC<CR>
elseif has("win16") || has("win32")
    nnoremap <Leader>ev :arge ~/vimfiles/vimrc<CR>
    nnoremap <Leader>ec :arge $VIMDIR/config/<C-z><S-Tab>
    nnoremap <Leader>sv :source ~/vimfiles/vimrc<CR>
endif

" noh with Return
nnoremap <CR> :nohlsearch<CR><CR>

" Just map Z to save files
nnoremap Z         :w<CR>
" Move buffers with [b ]b, removed maps
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

" Overrides unimpaired
" Remap quickfix list to use the hack
noremap <silent> [q :call WrapCommand('up', 'c')<CR>
noremap <silent> ]q :call WrapCommand('down', 'c')<CR>

" Remap location list to use the hack
noremap <silent> [l :call WrapCommand('up', 'l')<CR>
noremap <silent> ]l :call WrapCommand('down', 'l')<CR>

" Edit relevant ultisnip
nnoremap <Leader>us :UltiSnipsEdit<CR>