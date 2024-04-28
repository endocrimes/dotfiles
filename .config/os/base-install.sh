#!/usr/bin/env bash

apt-get update -y && apt-get install -y \
  build-essential \
  jq \
  vim \
  gh \
  ripgrep \
  curl \
  unzip \
  git \
  zsh

git submodule update --init --recursive
vim +PlugInstall +qall
