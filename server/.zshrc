# ~/.zshrc (server)
# -----------------
# mjturt
# In this file only host-specific configurations

# History

HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Autostart tmux

#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Basic settings

umask 077
zstyle ':completion:*' rehash true

# Environment variables

export BROWSER=elinks

# Powerlevel9k settings

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir root_indicator dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(disk_usage vcs)

POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='235'
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='196'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='166'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='235'
POWERLEVEL9K_DIR_HOME_BACKGROUND='166'
POWERLEVEL9K_DIR_HOME_FOREGROUND='235'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='166'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='235'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='235'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='166'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='235'
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='166'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='235'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='166'
POWERLEVEL9K_OS_ICON_FOREGROUND='166'
POWERLEVEL9K_OS_ICON_BACKGROUND='235'

POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_MODE='awesome-fontconfig'

# Antigen

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle systemd
#antigen bundle command-not-found

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Aliases

alias upgrade="apt-get update && apt-get upgrade"

# Sourcing the rest of files

source $HOME/.zsh/evars.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/private.zsh
source $HOME/.zsh/keybindings.zsh
