export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"
CASE_SENSITIVE="false"
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git osx ruby vim rails)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

alias zshconfig="edit ~/.zshrc"
alias ohmyzsh="edit ~/.oh-my-zsh"
alias homegit="git --work-tree=$HOME --git-dir=$HOME/.files.git"

alias showfiles="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"
alias sumproj="git ls-files | xargs wc -l"

alias reload_profile="source ~/.zshrc"

alias edit_hosts='edit /etc/hosts'
alias edit_httpd='edit /etc/apache2/httpd.conf'
alias edit_vhosts='edit /etc/apache2/extra/httpd-vhosts.conf'

alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard'"

## Git Related
alias gp='git push'
alias gs='git status'
alias ga='git commit --amend -a'
alias pull='git pull'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias xcignore='curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore'

# This alias recursively destroys all .DS_Store files in the folder I am currently in
alias DSNuke='find . -name .DS_Store -type f -delete'

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
