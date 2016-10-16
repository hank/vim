" Syntastic
" Never jump
let g:syntastic_auto_jump = 0
let g:syntastic_always_populate_loc_list = 1
" C / C++
" Disable system includes checks
let g:syntastic_ignore_files = ['Program Files', 'WinDDK', 'Windows Kits', 'Microsoft SDKs']
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_c_checkers = ["clang_tidy", "clang_check"]
"   Use compilation databases
let g:syntastic_c_clang_check_post_args = ""
let g:syntastic_c_clang_tidy_post_args = ""
"   Turn on analyze
let g:syntastic_clang_check_analyze = 1
" Python
let g:syntastic_python_checkers = ["flake8"]
if has("freebsd")
  let g:syntastic_shell = bash
endif
