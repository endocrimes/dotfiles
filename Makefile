.PHONY: osx homebrew homebrew-packages osx-config

osx: homebrew homebrew-packages osx-config

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

homebrew-packages:
	./.config/brew/install.sh

osx-config:
	./.config/os/osx/configure.sh
