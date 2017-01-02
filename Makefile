.PHONY: all osx homebrew homebrew-packages ruby-packages subtract xcode alcatraz airport osx-config swift

all: ruby-packages

osx: homebrew homebrew-packages swift alcatraz airport osx-config

ubuntu: apt-packages ruby-versions

apt-packages:
	./config/apt/install.sh

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./.config/brew/install.sh

ruby-versions:
	ruby-install ruby-2.2.5
	ruby-install ruby-2.1.0
	ruby-install ruby-2.3.1

ruby-packages:
	sudo gem install bundle
	bundle install

subtract:
	git clone git://github.com/DanielTomlinson/subtract ~/.oh-my-zsh/custom/themes

xcode:
	xcode-install install 6.3
	xcode-install install 7.2

swift:
	swiftenv install 2.2-SNAPSHOT-2016-01-11-a
	swiftenv global 2.2-SNAPSHOT-2016-01-11-a

alcatraz:
	curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

airport:
	sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

osx-config:
	./.config/osx
