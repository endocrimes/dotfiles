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

vim +'PlugInstall --sync' +qall
