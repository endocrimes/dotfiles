"" Plugins

call plug#begin('~/.vim/plugged')

"" Shared
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-projectionist'

"" Autocomplete
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

"" Clojure
Plug 'vim-scripts/VimClojure'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'

"" Elixir
Plug 'elixir-lang/vim-elixir'

"" Obj-C / Swift
Plug 'rhysd/vim-clang-format'
Plug 'keith/swift.vim'
Plug 'gfontenot/vim-xcodebuild'

"" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'

"" Prose
Plug 'junegunn/goyo.vim'

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

"" Other

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

"" Ruby

" Find related specs
function! s:RelatedSpec()
  let l:fullpath = expand("%:p")
  let l:filepath = expand("%:h")
  let l:fname = expand("%:t")
  
  let l:source_dirs = [ 'app/', 'Sources/', 'src/', 'lib/cocoapods/', 'lib/cocoapods-core/', 'lib/xctestrunner']
  let l:substitutions = [ [ ".rb$", "_spec.rb" ], [ ".rb$", "_test.rb" ], [ ".swift$", "Tests.swift" ], [ ".swift$", "Test.swift" ] ]

  let l:clean_filepath = l:filepath
  for source_dir in l:source_dirs
    let l:clean_filepath = substitute(l:clean_filepath, source_dir, "", "")
  endfor

  let l:test_names = []
  for substitution in l:substitutions
    let l:substituted = substitute(l:fname, get(substitution, 0, ''), get(substitution, 1, ''), "")
    call add(l:test_names, l:substituted)
  endfor

  let l:test_dirs = ["spec", "fast_spec", "test", "spec/unit", "Tests"]

  for test_name in l:test_names
    for test_dir in l:test_dirs
      let l:spec_path = test_dir . "/" . l:clean_filepath . "/" . test_name
      let l:full_spec_path = substitute(l:fullpath, l:filepath . "/" . l:fname, l:spec_path, "")
      if filereadable(l:spec_path)
        return l:full_spec_path
      end
    endfor
  endfor
endfunction

function! s:RelatedSpecOpenTab()
  let l:spec_path = s:RelatedSpec()
  if filereadable(l:spec_path)
    execute ":tabe " . l:spec_path
  endif
endfunction

function! s:RelatedSpecOpenSplit()
  let l:spec_path = s:RelatedSpec()
  if filereadable(l:spec_path)
    execute ":vsp " . l:spec_path
  endif
endfunction

command! RelatedSpecPath call s:RelatedSpec()
command! RelatedSpecOpenTab call s:RelatedSpecOpenTab()
command! RelatedSpecOpenSplit call s:RelatedSpecOpenSplit()
nnoremap <silent> <Leader>s :RelatedSpecOpenTab<CR>
nnoremap <silent> <Leader>S :RelatedSpecOpenSplit<CR>
