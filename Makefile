.PHONY: osx homebrew homebrew-packages ruby-versions xcode osx-config

osx: homebrew homebrew-packages osx-config

ubuntu: apt-packages ruby-versions

apt-packages:
	./config/os/ubuntu/install.sh

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./.config/brew/install.sh

ruby-versions:
	ruby-install ruby-2.2.5
	ruby-install ruby-2.1.0
	ruby-install ruby-2.3.1

osx-config:
	./.config/os/osx/configure.sh
