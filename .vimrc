call plug#begin('~/.vim/plugged')

"" Good Navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

"" Vim Language Server support
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"" Useful tools
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

"" Nice test running
Plug 'janko-m/vim-test'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'benmills/vimux'

"" Theming and UI tweaks
Plug 'altercation/vim-colors-solarized'
Plug 'dantoml/fairyfloss.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" GPG is a necessary evil.
Plug 'jamessan/vim-gnupg'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

"" Clojure
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"" Help I accidentally an ops
Plug 'hashivim/vim-terraform', { 'for': 'hcl' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'hcl' }
Plug 'fatih/vim-hclfmt'
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'hashivim/vim-hashicorp-tools'

"" Markdown
Plug 'plasticboy/vim-markdown'

"" Powershell: This is the saddest thing i ever added
Plug 'PProvost/vim-ps1'

"" Golang
Plug 'fatih/vim-go', { 'for': 'go' }

"" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }

"" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rake'

"" Other
Plug 'keith/swift.vim'
Plug 'rust-lang/rust.vim'
Plug 'aklt/plantuml-syntax'

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
set nowritebackup              " No, seriously, danger is my middle name

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
cnoreabbrev X x
cnoreabbrev Xa xa
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
augroup numberwang
  autocmd!
  autocmd InsertEnter * silent! :set norelativenumber
  autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber
augroup END

" Rainbow parens for Clojure

let g:rbpt_max = 15

augroup filetype_clojure
  autocmd!
  autocmd Filetype clojure RainbowParenthesesActivate
  autocmd Syntax clojure RainbowParenthesesLoadRound
  autocmd Filetype clojurescript RainbowParenthesesActivate
  autocmd Syntax clojurescript RainbowParenthesesLoadRound
augroup END

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

"" Testing
let test#strategy = "vimux"
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
" Language Server Protocols
"

"" Bash: https://github.com/mads-hartmann/bash-language-server
if executable('bash-language-server')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'whitelist': ['sh', 'bash'],
          \ })
    autocmd FileType sh setlocal omnifunc=lsp#complete
    autocmd FileType bash setlocal omnifunc=lsp#complete
  augroup END
endif

"" Golang: go get -u golang.org/x/tools/cmd/golsp
if executable('golsp')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go',
        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif

"" Clojure: https://github.com/snoe/clojure-lsp
if executable('clojure-lsp')
  augroup LspClojure
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'clojure-language-server',
          \ 'cmd': {server_info->['clojure-lsp']},
          \ 'whitelist': ['clojure'],
          \ })
    autocmd FileType clojure setlocal omnifunc=lsp#complete
  augroup END
endif

"" Rust: rustup component add rls-preview rust-analysis rust-src
if executable('rls')
  augroup LspRust
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'rls',
          \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
          \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
          \ 'whitelist': ['rust'],
          \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
  augroup END
endif

"" Ruby: gem install solargraph
if executable('solargraph')
  augroup LspRuby
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'solargraph',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
          \ 'initialization_options': {"diagnostics": "true"},
          \ 'whitelist': ['ruby'],
          \ })
    autocmd FileType ruby setlocal omnifunc=lsp#complete
  augroup END
endif


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup Asyncomplete
  au!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

let g:asyncomplete_remove_duplicates = 1

"
" Python
"
let python_highlight_all=1

"
" Clojure
"

let g:clojure_align_subforms = 1
" Make sure that .cljx files are recognised as Clojure.
autocmd BufNewFile,BufRead *.cljx setlocal filetype=clojure

autocmd FileType clojure nmap <Leader>t :RunTests<CR>

"
" Go
"
" Enable syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = "godef"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Automatically lookup info
" set updatetime=100 disabled because gocode/guru are borked rn
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:ale_linters = {'go': ['golint', 'govet', 'errcheck']}

augroup filetype_go
  autocmd!

  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " Look ups and documentation
  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
augroup END

"
" Rust
"
augroup filetype_rust
  autocmd!
augroup END

let g:autofmt_autosave = 1

"
" Docker
"

" Make sure that Dockerfile.{release,development} files are recognised as Dockerfiles.
" - This explcitily whitelists extensions to allow e.g .m4 templates to render
"   correctly.
autocmd BufNewFile,BufRead Dockerfile.release setlocal filetype=dockerfile
autocmd BufNewFile,BufRead Dockerfile.dev* setlocal filetype=dockerfile

"
" Markdown
"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['go=go', 'viml=vim', 'bash=sh']
let g:vim_markdown_new_list_item_indent = 2
