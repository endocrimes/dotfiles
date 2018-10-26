#!/usr/bin/env bash

brew install caskroom/cask/brew-cask;
brew tap caskroom/fonts;
brew tap dantoml/formulae;
brew tap kylef/formulae;

function install_brew() {
	brew install "$1";
}

function install_cask() {
	brew cask install "$1";
}

install_brew zsh;
install_brew vim;
install_brew tree;
install_brew wget;
install_brew ffmpeg;
install_brew python;
install_brew python3;
install_brew gnupg2;
install_brew git;
install_brew hub;
install_brew tmux;
install_brew class-dump;
install_brew shellcheck;

install_brew mutt;
install_brew offlineimap;
install_brew msmtp;
install_brew mpv; # Notifications from mutt

install_brew dantoml/formulae/git-cleanup;
install_brew dantoml/formulae/git-promote;

install_cask font-inconsolata;
install_cask font-fontawesome;
install_cask iterm2;
