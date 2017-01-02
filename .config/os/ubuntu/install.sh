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

install_package "Vim" "vim"

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

install_package "New Sources" "apt-transport-https"
install_package "New Certificates" "ca-certificates"

sudo apt-key adv \
  --keyserver hkp://ha.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

add_to_source_list "https://apt.dockerproject.org/repo ubuntu-xenial main" "docker"

execute "apt-get update"

install_package "Docker" "docker-engine"

