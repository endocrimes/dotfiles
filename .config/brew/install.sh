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
install_brew fish;
install_brew vim;
install_brew tree;
install_brew wget;
install_brew ffmpeg;
install_brew python;
install_brew python3;
install_brew rbenv;
install_brew ghc;
install_brew gnupg2;
install_brew cabal-install;
install_brew git;
install_brew hub;
install_brew heroku-toolbelt;
install_brew tmux;
install_brew class-dump;
install_brew npm;
install_brew node;
install_brew shellcheck;
install_brew notmuch;
install_brew alot;
install_brew msmtp;
install_brew getmail;
install_brew w3c;

install_brew kylef/formulae/swiftenv;

install_brew dantoml/formulae/git-cleanup;
install_brew dantoml/formulae/git-promote;

install_cask font-inconsolata;
install_cask font-fontawesome;
install_cask iterm2;
install_cask audio-hijack;
install_cask alfred;
install_cask airdisplay;
install_cask slack;
install_cask hopper-disassembler;
install_cask reveal;
install_cask charles;
install_cask tower;
install_cask conductor;
install_cask google-chrome;
install_cask quickradar;
