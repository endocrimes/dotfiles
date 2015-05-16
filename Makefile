all: ruby-packages

osx: homebrew homebrew-packages

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./Brewfile.sh

ruby-packages:
	gem install bundle
	bundle install

subtract:
	git clone git://github.com/DanielTomlinson/subtract ~/.oh-my-zsh/custom/themes

