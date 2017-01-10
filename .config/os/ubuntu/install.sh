#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../util.sh" \
  && . "util.sh"


# Install tools for compiling/building software from source.

install_package "Build Essential" "build-essential"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# GnuPG archive keys of the Debian archive.

install_package "GnuPG archive keys" "debian-archive-keyring"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Git" "git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "ZSH" "zsh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Vim" "vim-nox-py2"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Tree" "tree"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "wget" "wget"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Shellcheck" "shellcheck"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Python" "python"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Python 3" "python3"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Tmux" "tmux"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Terminator" "terminator"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "exfat-fuse" "exfat-fuse"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "exfat-utils" "exfat-utils"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "notmuch" "notmuch"
install_package "alot" "alot"
install_package "msmtp" "msmtp"
install_package "getmail" "getmail4"
install_package "w3m" "w3m"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "GnuPG2" "gnupg2"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#if ! command_exists "nvm"; then
#  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
#fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "Node Package Manager" "npm"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# chruby isn't a fun time on ubuntu
install_package "rbenv" "rbenv"
install_package "ruby buid" "ruby-build"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package "New Sources" "apt-transport-https"
install_package "New Certificates" "ca-certificates"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "spotify-client"; then
  add_to_source_list "http://repository.spotify.com stable non-free" "spotify.list"
  execute "sudo apt-get update"
  install_package "Spotify" "spotify-client"
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "docker-engine"; then

  sudo apt-key adv \
    --keyserver hkp://ha.pool.sks-keyservers.net:80 \
    --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  add_to_source_list "https://apt.dockerproject.org/repo ubuntu-xenial main" "docker.list"

  execute "sudo apt-get update"

  install_package "Docker" "docker-engine"
fi
