all: ruby-packages

osx: homebrew homebrew-packages xcode alcatraz

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./Brewfile.sh

ruby-packages:
	sudo gem install bundle
	bundle install

subtract:
	git clone git://github.com/DanielTomlinson/subtract ~/.oh-my-zsh/custom/themes

xcode:
	xcode-install install 6.3

alcatraz:
	curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/master/Scripts/install.sh | sh
