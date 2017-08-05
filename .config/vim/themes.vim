" Maintainer: Danielle Tomlinson <dan@tomlinson.io>
" From: https://github.com/dantoml/dotfiles

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

set background=dark
colorscheme solarized
call togglebg#map("<F5>")

if has("gui_running")
  set guifont=Fira\ Code\ Retina:h14
endif
