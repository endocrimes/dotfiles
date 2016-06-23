export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'
export GOPATH='~/.gopath'

export PROMPT='$ '

alias showfiles="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias reload_profile="source ~/.zshrc"

alias edit_hosts='edit /etc/hosts'
alias edit_httpd='edit /etc/apache2/httpd.conf'
alias edit_vhosts='edit /etc/apache2/extra/httpd-vhosts.conf'

alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard'"

alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
alias xcp="open *.xcodeproj"
alias xcw="open *.xcworkspace"
alias xc="xcw; or xcp"
alias gs="git s"
alias ga="git add"
alias gc="git commit"
alias l="ls -lah"
alias clean-branches="git branch --merged | grep -v '\*' | grep -v master | grep -v dev | xargs -n 1 git branch -d"

## Bundle
alias be="bundle exec"

## CocoaPods
alias csu="bundle exec rake spec:unit"

## Git Related
alias xcignore='curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore'

## Swift Toolchain
export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH"

## Swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

## Random Scripts
export PATH="~/bin:$PATH"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
