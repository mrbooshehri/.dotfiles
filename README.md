# Dependence
1. git
2. stow
# Usage
1. clone the repo
```bash
git clone https://github.com/mrbooshehri/.dotfiles.git
``` 
2. use stow to create symbolic links 
```bash 
stow --adopt -vt ~ * 
```
## Note
1. you can use ```-nvt``` if you are not sure what's going on!
2. remove existing config directories before creating symbolic link 

