# .zshrc
# mjturt

# Antibody
source ~/.zsh/plugins.sh

# Completion
autoload -Uz compinit && compinit
compinit
zstyle :compinstall filename '/home/mjt/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
eval $(dircolors)
zstyle    ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle    ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Variables
export EDITOR="vim"
export BROWSER="firefox"
export PATH="$PATH:$HOME/cloud/bin/:$HOME/.cargo/bin/"

# Prompt
#autoload -Uz promptinit && promptinit
#prompt gentoo
source ~/.zsh/themes/garu.zsh-theme

# History
HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Basic settings
setopt appendhistory
setopt extended_history
setopt clobber
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
setopt COMPLETE_ALIASES
setopt multios 
setopt automenu
setopt autolist
setopt complete_in_word
setopt always_to_end
setopt menucomplete
setopt globdots
unsetopt correct_all
unsetopt beep
bindkey -e
autoload -Uz add-zsh-hook

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

zstyle ':completion:*' rehash true

# Colors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

# Sourcing
source $HOME/.zsh/aliases
source $HOME/.zsh/aliases.private
source $HOME/.zsh/functions
source $HOME/.zsh/keybindings
