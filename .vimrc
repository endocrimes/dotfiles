source $VIM_CONFIG_HOME/plugins.vim
source $VIM_CONFIG_HOME/clipboard.vim
source $VIM_CONFIG_HOME/themes.vim
source $VIM_CONFIG_HOME/ctrlp.vim
source $VIM_CONFIG_HOME/clojure.vim
source $VIM_CONFIG_HOME/go.vim


"" Airline
:set laststatus=2 " Required to work without splits.

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

"" Save
nmap <leader>w :w!<cr>

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj
map k gk
map j gj

"" Mousing
set mouse=a

"" Testing
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

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

"" Sometimes disabling this is really nice.
nnoremap <leader><space> :nohlsearch<CR>

" Highlight current line
set cursorline

" Enable line wrapping
set wrap linebreak nolist
set colorcolumn=80


"" Abbreviations

" Nobody is happy until they have these
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

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

"" Other

"" Python
let python_highlight_all=1

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

