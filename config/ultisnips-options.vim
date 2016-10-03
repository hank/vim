""" Ultisnips
" Remove warning about python if in the console
if !has('gui_running')
    let g:UltiSnipsNoPythonWarning = 1
endif
let g:UltiSnipsSnippetsDir = $VIMDIR.'/MyUltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $VIMDIR.'/MyUltiSnips']
let g:UltiSnipsEnableSnipMate = 0
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
