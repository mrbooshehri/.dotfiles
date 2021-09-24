setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
unsetopt CASE_GLOB
eval "$(starship init zsh)"

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# Make it case insensetive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Speed up compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/cache"
compinit

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load plugins
source ~/.src/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.src/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source ~/.src/zsh/jq-zsh-plugin/jq.plugin.zsh 2>/dev/null
# Functions
fcd() {
 cd "$(find -maxdepth 2 -type d | fzf)" 
}

hdd(){
  cd "$(find /mnt/1TB/ -maxdepth 3 -type d 2>/dev/null | fzf)"
}

open() {
  xdg-open "$(find -type f | fzf)"
}

cheat() {
  curl -s4 cheat.sh/$1\?T > /tmp/cheat.md
  glow -p /tmp/cheat.md
}

upload() {
  curl -s4 --upload-file $1 https://transfer.sh/$1
}

download() {
  curl -s4 $1 -o $2
}

# Aliases
alias zshconf="vim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias bshconf="vim ~/.bashrc"
alias srcbsh="source ~/.bashrc"
alias vimconf="vim ~/.vimrc"
alias autoremove="sudo pacman -Rcns $(pacman -Qdtq)"

alias ..="cd .."
alias rm="rm -i"
alias mv="mv -i"
alias ls="exa --icons --group-directories-first"
alias :q="exit"

alias rndman="~/scripts/bash/rndman.sh"
alias findman="~/scripts/bash/findman.sh"

# Nipe aliases
#alias nipstr="~/scripts/nipe/nipstr.sh"
#alias nipstp="~/scripts/nipe/nipstp.sh"
#alias nipstat="~/scripts/nipe/nipstat.sh"

# Env variables
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/.cargo/bin"
export PATH="${PATH}:${HOME}/.emacs.d/bin"
export EDITOR="vim"
#export PAGER="bat"

# nnn
alias nnn="nnn -P p"
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PLUG='b:bookmarks;c:rsynccp;d:dragdrop;f:finder;m:mptmount;p:preview-tui-ext;s:kedeconnect;w:wall'
export NNN_BMS="1:/mnt/1TB;l:/mnt/1TB/Documents/Learning;D:/mnt/1TB/Downloads;d:/mnt/1TB/Documents"

