all: ruby-packages

osx: homebrew homebrew-packages oh-my-zsh subtractzsh-autocomplete

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./Brewfile.sh

ruby-packages:
	gem install bundle
	bundle install

oh-my-zsh:
	curl -L http://install.ohmyz.sh | sh

subtract:
	git clone git://github.com/DanielTomlinson/subtract ~/.oh-my-zsh/custom/themes

zsh-autocomplete:
	git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions
	sh ~/.zsh-autosuggestions/install
