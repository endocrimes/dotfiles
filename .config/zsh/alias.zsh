
alias scp="scp -F ~/.ssh/config"
alias tmux="tmux -2"

# File System

alias l="ls -lah"

# Git

alias gs="git status --ignore-submodules"

## Clean up all local branches that are fully merged.
#
# This does not touch the remote so should be fine to run as often as you pull.
#
alias clean-branches="git branch --merged | grep -v '\*' | grep -v master | grep -v dev | xargs -n 1 git branch -d"

function open-dirty-files() {
  vim -p $(git status --ignore-submodules --porcelain | awk '{print $2}')
}

## Emacs
alias ec="emacsclient -c -nw -t -a ''"

## I use docker-compose way more often than I use a decimal calculator.
alias dc="docker-compose"

## Bundle
alias be="bundle exec"

## CocoaPods
alias csu="bundle exec rake spec:unit"

## Dotfiles Management
alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"

alias reload_profile="source $HOME/.zshrc"

alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard'"
