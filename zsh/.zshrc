# Exports ---------------------------------------------------------------------------
export USER="$(whoami)"
export GITUSER="mrbooshehri"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export SNIPPETS="$DOTFILES/snippets"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/Templates"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Videos"
export PDFS="$DOCUMENTS/PDFS"
export NOTES="$DOCUMENTS/Notes"
export HDD="/mnt/1TB"
export EXDOCUMENTS="$HDD/Documents"
export EXDOWNLOADS="$HDD/Downloads"
export EXPICTURES="$HDD/Pictures"
export EXMUSIC="$HDD/Music"
export EXVIDEOS="$HDD/Videos"
export VIRTUALMACHINES="$HDD/$EXDOCUMENTS/Virtual\ Machines"
export WORKSPACES="$HOME/Workspaces" # container home dirs for mounting
export ZETDIR="$GHREPOS/zet"
export CLIP_DIR="$VIDEOS/Clips"
export CLIP_VOLUME=0
export CLIP_SCREEN=0
export TERM=xterm-256color
export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# Zsh configs -----------------------------------------------------------------------
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
bindkey '^H' backward-delete-word

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Path ------------------------------------------------------------------------------
pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//":$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export pathappend

pathprepend() {
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//:"$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="$arg${PATH:+":${PATH}"}"
  done
} && export pathprepend

# remember last arg will be first in path
pathprepend \
  "${HOME}/.emacs.d/bin" \
  "$HOME/.local/bin" \
  "$SCRIPTS" 

pathappend \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/sbin \
  /usr/bin \
  /sbin \
  /bin

# Load plugins ----------------------------------------------------------------------
source ~/.src/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.src/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source ~/.src/zsh/jq-zsh-plugin/jq.plugin.zsh 2>/dev/null

# Funstions -------------------------------------------------------------------------

_have()      { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

source ~/scripts/bash/bashFunctions/dirFileHelper	# Directory and file helper
source ~/scripts/bash/bashFunctions/cheat		# Cheat.sh
source ~/scripts/bash/bashFunctions/transfersh		# transfersh
source ~/scripts/bash/bashFunctions/cambinary		# seach in cambridge dictionary
source ~/scripts/bash/bashFunctions/haste		# hastebin online clipboard

#clonerepo() {
#  local repo="$1"
#  local repo="${repo#https://github.com/}"
#  local user="${repo%%/*}"
#  local name="${repo##*/}"
#  local userd="$REPOS/github.com/$user"
#  local path="$userd/$name"
#  echo $path
#  [[ -d "$path" ]] && cd "$path" && return
#  /bin/mkdir -p "$userd"
#  cd "$userd"
#  /bin/git clone "https://github.com/$user/$name.git"
#  cd "$name"
#} 

# Aliases ---------------------------------------------------------------------------
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias snippets='cd $SNIPPETS'
alias free='free -h'
alias df='df -h'
alias chmox='chmod +x'
alias temp='cd $(mktemp -d)'
alias view='vi -R' # which is usually linked to vim
alias clear='printf "\e[H\e[2J"'
alias grep="grep -P"
alias autoremove="sudo pacman -Rcns $(pacman -Qdtq)"
alias ..="cd .."
alias rm="rm -i"
alias mv="mv -i"
alias ls="exa --icons --group-directories-first"
alias :q="exit"
alias pcp="rsync -rnhP"

# Pager -----------------------------------------------------------------------------
if [[ -x /usr/bin/lesspipe ]]; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

# nnn
#alias nnn="nnn -P p"
#export NNN_FIFO='/tmp/nnn.fifo'
#export NNN_PLUG='b:bookmarks;c:rsynccp;d:dragdrop;f:finder;m:mptmount;p:preview-tui-ext;s:kedeconnect;w:wall'
#export NNN_BMS="1:/mnt/1TB;l:/mnt/1TB/Documents/Learning;D:/mnt/1TB/Downloads;d:/mnt/1TB/Documents"

# Load tmux
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach || tmux new-session && exit
#fi
