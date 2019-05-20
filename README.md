# Dotfiles

To Install: 
```bash
# Pull and Install Dotfiles
git --work-tree=$HOME --git-dir=$HOME/.files.git init && \
git --work-tree=$HOME --git-dir=$HOME/.files.git remote add origin https://github.com/endocrimes/dotfiles.git && \
git --work-tree=$HOME --git-dir=$HOME/.files.git pull origin master && \
git --work-tree=$HOME --git-dir=$HOME/.files.git submodule update --recursive && \
make osx
```
