" Maintainer: Danielle Tomlinson <dan@tomlinson.io>
" From: https://github.com/dantoml/dotfiles

" This ignores the `.git` directory and submodules by default
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" If ripgrep is installed, use it, as it is /fast/.
if executable('rg')
  " Use rg instead of grep
  set grepprg=rg\ --column\ --color=never

  " Use rg for ctrlp for listing files
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " rg is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
endif
