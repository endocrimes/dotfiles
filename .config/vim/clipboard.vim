" Maintainer: Danielle Tomlinson <dan@tomlinson.io>
" From: https://github.com/dantoml/dotfiles
"
" Integrates with the system keyboard on Unix systems (both darwin and not
" darwin).

"" On macOS, this is the unnamed pasteboard, on other unix systems this is +
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif
