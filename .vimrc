"" Plugins

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'keith/swift.vim'
Plug 'gfontenot/vim-xcodebuild'
Plug 'kien/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'rhysd/vim-clang-format'

call plug#end()

"" Basic

" Sensible Backspace Support
:set backspace=indent,eol,start

" Formatting
set tabstop=2    " Use 2 spaces to a tab
set shiftwidth=2 " As above
set expandtab    " Expand tabs into spaces

autocmd FileType swift set noexpandtab

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
    set guifont=Inconsolata-dz:h14
  endif
endif

"" Abbreviations

" Nobody is happy until they have these
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" Autocomplete <3
imap § <C-P>

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

"" Other

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
