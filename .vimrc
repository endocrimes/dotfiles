call plug#begin('~/.vim/plugged')

"" Shared
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-projectionist'
Plug 'janko-m/vim-test'
Plug 'ntpeters/vim-better-whitespace'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'benmills/vimux'

"" Theming and UI tweaks
Plug 'altercation/vim-colors-solarized'
Plug 'dantoml/fairyfloss.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" GitHub
Plug 'keith/gist.vim'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

"" Clojure
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'

Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
call plug#end()

set nocompatible " required (to be iMproved)

"
" Settings
"
let mapleader=','
syntax enable                  " Editing without highlighting is sadness
set ruler                      " Because some people make lists like this
set noerrorbells               " please don't make noises
set backspace=indent,eol,start " Makes backspace more useful
set noswapfile                 " I like to live dangerously
set nobackup                   " Very dangerously in fact
set nowritebackup

set wrap linebreak nolist
set colorcolumn=80
set cursorline

set splitright
set splitbelow
set encoding=utf-8
set autowrite                  " Autosave before :make/:test etc
au FocusLost * :wa             " Set vim to save the file on focus out.

set hlsearch                   " Highlight found searches
set incsearch                  " Show matches whilst typing

set tabstop=2                 " Use 2 spaces to a tab
set shiftwidth=2              " As above
set expandtab                 " Expand tabs into spaces

set mouse=a
set laststatus=2              " Airline, Required to work without splits.

set gcr=a:blinkon0            " Disable the blinking cursor.
set scrolloff=3

" Nobody is happy until they have these
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

"" Maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Automatically switch between relativenumber and regular numbering when
"" going in and out of insert mode.
set number
nnoremap <silent><leader>1 :set rnu! rnu? <cr>
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Rainbow parens for Clojure

let g:rbpt_max = 15
autocmd Filetype clojure RainbowParenthesesActivate
autocmd Syntax clojure RainbowParenthesesLoadRound
autocmd Filetype clojurescript RainbowParenthesesActivate
autocmd Syntax clojurescript RainbowParenthesesLoadRound

if has("termguicolors")
  set termguicolors
  set background=dark
  colorscheme fairyfloss
  let g:rbpt_colorpairs = [
        \ ['brown',    '#a8a4b1'],
        \ ['Darkblue',    '#c5a3ff'],
        \ ['darkgray',    '#a8a4b1'],
        \ ]
else
  set background=dark
  colorscheme solarized
  call togglebg#map("<F5>")
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
endif

if has("gui_running")
  set guifont=Fira\ Code\ Retina:h14
else
  " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

"" Save
nmap <leader>w :w!<cr>

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj
map k gk
map j gj

"" Mousing

"" Testing
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Make
nnoremap <Leader>m :make<CR>

" NERDTree configuration
let g:NERDTreeShowHidden=1
noremap <Leader>3 :NERDTreeToggle<CR>

"" Python
let python_highlight_all=1

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

"
" Clipboard Support
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

"
" CtrlP
"

" If ripgrep is installed, use it, as it is /fast/.
if executable('rg')
  " Use rg instead of grep
  set grepprg=rg\ --column\ --color=never

  " Use rg for ctrlp for listing files
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " rg is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
else
  " This ignores the `.git` directory and submodules by default
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

"
" Clojure
"

let g:clojure_align_subforms = 1

" Make sure that .cljx files are recognised as Clojure.
autocmd BufNewFile,BufRead *.cljx setlocal filetype=clojure

"
" Go
"
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)

" Look ups and documentation
autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Enable syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Syntastic doesn't always play nicely with vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
