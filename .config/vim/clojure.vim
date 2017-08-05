" Maintainer: Danielle Tomlinson <dan@tomlinson.io>
" From: https://github.com/dantoml/dotfiles

let g:clojure_align_subforms = 1

" Make sure that .cljx files are recognised as Clojure.
autocmd BufNewFile,BufRead *.cljx setlocal filetype=clojure

" Rainbow parens for Clojure

" Remove Black Parens
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 15
autocmd Filetype clojure RainbowParenthesesActivate
autocmd Syntax clojure RainbowParenthesesLoadRound
autocmd Filetype clojurescript RainbowParenthesesActivate
autocmd Syntax clojurescript RainbowParenthesesLoadRound
