# dotfiles

repository contains my linux configuration files. lovingly called dot files 
due to the hidden attribute. 


## Setup

```
cd
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles remote add origin git@github.com:lukemgriffith/dotfiles.git
dotfiles fetch --all --prune
dotfiles checkout -B macos
```
