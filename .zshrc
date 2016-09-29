export EDITOR='vim'
export GOPATH='.'

# Machine specific configuration
#

if [ -f $HOME/.zsh.private ]; then
  source $HOME/.zsh.private
fi

# History Support
#

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# General
#

# Prompt

function __git_prompt() {
  local gitcurrent=`git current 2> /dev/null`
  if [[ -n $gitcurrent ]]; then
    echo "[$gitcurrent] "
  fi
}
local git_prompt='$(__git_prompt)'

setopt PROMPT_SUBST
export PS1="$git_prompt$ "

# Command Alias
#

## Dotfile management

alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"

alias reload_profile="source ~/.zshrc"

alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard'"


## File System Helpers

alias showfiles="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias l="ls -lah"

## Xcode

alias xcp="open *.xcodeproj"
alias xcw="open *.xcworkspace"

## Git

alias gs="git status"

## Clean up all local branches that are fully merged.
#
# This does not touch the remote so should be fine to run as often as you pull.
#
alias clean-branches="git branch --merged | grep -v '\*' | grep -v master | grep -v dev | xargs -n 1 git branch -d"

## Docker

## I use docker-compose way more often than I use a decimal calculator.
alias dc="docker-compose"

## Bundle
alias be="bundle exec"

## CocoaPods
alias csu="bundle exec rake spec:unit"

## Git Related
alias xcignore='curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore'

## Swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

## Random Scripts
export PATH="~/bin:$PATH"

## GPG
#

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

## Ruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
