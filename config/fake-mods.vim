""" Get a nonsense text like Lorem ipsum
"call fake#define('sentence', 'fake#capitalize('
"        \ . 'join(map(range(fake#int(3,15)),"fake#gen(\"nonsense\")"))'
"        \ . ' . fake#chars(1,"..............!?"))')
"
"call fake#define('paragraph', 'join(map(range(fake#int(3,10)),'
"    \ . '"fake#gen(\"sentence\")"))')
"
""" Alias
"call fake#define('lipsum', 'fake#gen("paragraph")')
