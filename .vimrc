"" Plugins

call plug#begin('~/.vim/plugged')

"" Shared
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'

"" File Management
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

"" Theming and UI tweaks
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'

"" Git
Plug 'tpope/vim-fugitive'

"" GitHub
Plug 'jaxbot/github-issues.vim'
Plug 'keith/gist.vim'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

"" Secrets!
Plug 'jamessan/vim-gnupg'

"" Clojure
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'

"" Elixir
Plug 'elixir-lang/vim-elixir'

"" Obj-C / Swift
Plug 'keith/swift.vim'

"" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'

"" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

"" Airline
:set laststatus=2 " Required to work without splits.

"" Basic

" Integrate with system keyboard
set clipboard=unnamed

" Sensible Backspace Support
:set backspace=indent,eol,start

" Formatting
set tabstop=2    " Use 2 spaces to a tab
set shiftwidth=2 " As above
set expandtab    " Expand tabs into spaces

autocmd FileType swift set tabstop=4
autocmd FileType swift set shiftwidth=4

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Map leader to ,
let mapleader=','

"" Mousing
set mouse=a

"" Visual Settings
syntax enable
set ruler

" Line Numbering
set number

"" Automatically switch between relativenumber and regular numbering when
"" going in and out of insert mode.
nnoremap <silent><leader>1 :set rnu! rnu? <cr>
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Highlight all search matches
set hlsearch

" Highlight current line
set cursorline 

" Enable line wrapping
set wrap linebreak nolist
set colorcolumn=80

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Pretty Colours
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Fira\ Code\ Retina:h14
  endif
endif

"" Abbreviations

" Nobody is happy until they have these
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" Autocomplete <3
imap <Leader>` <C-P>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
set splitright

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Make
nnoremap <Leader>m :make<CR>

" NERDTree configuration
let g:NERDTreeShowHidden=1
noremap <Leader>3 :NERDTreeToggle<CR>

" CtrlP configuration
"" This ignores the `.git` directory and submodules.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"" Other

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

"" Clojure
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

