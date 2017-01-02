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

