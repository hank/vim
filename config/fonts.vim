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
