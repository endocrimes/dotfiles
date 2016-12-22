# Dotfiles

To Install: 
```bash
# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Pull and Install Dotfiles
git --work-tree=$HOME --git-dir=$HOME/.files.git init && \
git --work-tree=$HOME --git-dir=$HOME/.files.git remote add origin https://github.com/DanToml/Dotfiles.git && \
git --work-tree=$HOME --git-dir=$HOME/.files.git pull origin master && \
make osx
```
