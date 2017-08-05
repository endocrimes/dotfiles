call plug#begin('~/.vim/plugged')

"" Shared
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'

"" File Management
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

"" Theming and UI tweaks
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" GitHub
Plug 'jaxbot/github-issues.vim'
Plug 'keith/gist.vim'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

"" Secrets!
Plug 'jamessan/vim-gnupg'

"" Clojure
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
" Plug 'venantius/vim-cljfmt'

"" Elixir
Plug 'elixir-lang/vim-elixir'

"" Go
Plug 'fatih/vim-go'

"" Obj-C / Swift
Plug 'keith/swift.vim'

"" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'

"" Rust
Plug 'rust-lang/rust.vim'

"" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
call plug#end()
