
# Aliases to enable/disable hidden files on macOS

alias showfiles="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

## Xcode

alias xcp="open *.xcodeproj"
alias xcw="open *.xcworkspace"
alias xcignore='curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore'

## Keyboard

function __remove_file_if_present() {
  if [ -f $1 ]; then
    rm $1
  fi
}

function __backup_file() {
  BACKUP_PATH="$1.bkp"
  __remove_file_if_present $BACKUP_PATH
  cp $1 $BACKUP_PATH
}

function use-keyboard-config() {
  KARIBINER_CONFIG_PATH="$HOME/.karabiner.d/configuration/karabiner.json"
  CONFIGURATIONS_DIR="$HOME/.config/karabiner"

  NEW_CONFIG_PATH="$CONFIGURATIONS_DIR/$1.json"

  if [ ! -f $NEW_CONFIG_PATH ]; then
    echo "No configuration exists at path: $NEW_CONFIG_PATH"
    return
  fi

  echo "Switching to configuration: $NEW_CONFIG_PATH"

  __backup_file $KARIBINER_CONFIG_PATH
  rm $KARIBINER_CONFIG_PATH
  cp $NEW_CONFIG_PATH $KARIBINER_CONFIG_PATH

  echo "Done! - Your old config can be found at $KARIBINER_CONFIG_PATH.bkp"
}

function save-keyboard-config() {
  KARIBINER_CONFIG_PATH="$HOME/.karabiner.d/configuration/karabiner.json"
  CONFIGURATIONS_DIR="$HOME/.config/karabiner"
  NEW_CONFIG_PATH="$CONFIGURATIONS_DIR/$1.json"
  if [ -f $NEW_CONFIG_PATH ]; then
    echo "Configuration already exists at path: $NEW_CONFIG_PATH. Making backup."
    __backup_file $NEW_CONFIG_PATH
    rm $NEW_CONFIG_PATH
  fi

  cp $KARIBINER_CONFIG_PATH $NEW_CONFIG_PATH

  echo "Saved to: $NEW_CONFIG_PATH!"
}

# GPG

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
