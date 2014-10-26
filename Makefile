all: ruby-packages

osx: homebrew homebrew-packages oh-my-zsh

homebrew:
	ruby -e '$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)'

homebrew-packages:
	./Brewfile.sh | sh

ruby-packages:
	gem install bundle
	bundle install

oh-my-zsh:
	curl -L http://install.ohmyz.sh | sh
