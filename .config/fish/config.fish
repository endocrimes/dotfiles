set fish_greeting
set -x EDITOR vim
set -x LSCOLORS Gxfxcxdxbxegedabagacad

set -U fish_user_paths ~/bin

alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
alias xcp="open *.xcodeproj"
alias xcw="open *.xcworkspace"
alias gs="git s"
alias ga="git add"
alias gc="git commit"
alias l="ls -lah"
alias clean-branches="git branch --merged | grep -v '\*' | grep -v master | grep -v dev | xargs -n 1 git branch -d"
