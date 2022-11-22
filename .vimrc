call plug#begin('~/.vim/plugged')

"" Good Navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

"" Vim Language Server support
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

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

"" Help I accidentally an ops
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'hcl' }
Plug 'fatih/vim-hclfmt'
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
Plug 'rust-lang/rust.vim'
Plug 'aklt/plantuml-syntax'
Plug 'OmniSharp/omnisharp-vim'
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
set ttymouse=sgr              " Fix mouse clicks after 220th column. Vim without
                              "  mouse_sgr should be considered broken.
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

if has("gui_running")
  set guifont=Fira\ Code:14
else
  " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if has("termguicolors")
  set termguicolors
  set background=dark
  colorscheme fairyfloss
else
  set background=dark
  colorscheme solarized
  call togglebg#map("<F5>")
endif

"" Configure Supertab lookup chain

autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif

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
" if executable('bash-language-server')
"   augroup LspBash
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"           \ 'name': 'bash-language-server',
"           \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
"           \ 'whitelist': ['sh', 'bash'],
"           \ })
"     autocmd FileType sh setlocal omnifunc=lsp#complete
"     autocmd FileType bash setlocal omnifunc=lsp#complete
"   augroup END
" endif

" Rust: rustup component add rls-preview rust-analysis rust-src
if executable('rustup')
  augroup LspRust
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'rust-analyzer',
          \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rust-analyzer']},
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
          \ 'whitelist': ['rust'],
          \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
  augroup END
endif

let g:OmniSharp_server_use_net6 = 1
augroup LspCsharp
  au!
  if executable('OmniSharp')
    let g:OmniSharp_server_path = exepath("OmniSharp")
  endif

  autocmd FileType cs nmap K <Plug>(OmniSharpPreviewDefinition)

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup
  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
augroup END

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

let g:ale_linters = {'go': ['errcheck'], 'cs': ['OmniSharp']}

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
let g:go_fmt_command = "gofmt"
let g:go_def_mode = "gopls"

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
set updatetime=100
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

augroup filetype_go
  autocmd!

  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " Look ups and documentation
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go setlocal omnifunc=go#complete#Complete
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
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md* setlocal textwidth=80
