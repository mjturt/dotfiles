#┃ ~/.zshrc
#┣━━━━━━━━━
#┃ mjturt

### Plugins

if [[ ! -f /usr/local/bin/antibody ]]; then
   curl -sL git.io/antibody | sudo sh -s
   /usr/local/bin/antibody bundle < ~/.zsh/plugins > ~/.zsh/plugins.sh
fi
source ~/.zsh/plugins.sh

### Completion

autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/mjt/.zshrc'
zstyle ':completion:*' menu select=3
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:processes' command 'ps -au$USER'
#zstyle ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*' verbose true
zstyle ':completion:*:-command-:*:' verbose false
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:' prompt 'correct to: %e'
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _files _ignored
zstyle ':completion:*' rehash true
zstyle ':completion:*:parameters' list-colors '=*=34'
zstyle ':completion:*:commands' list-colors '=*=1;32'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*:options' list-colors '=^(-- *)=33'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

setopt auto_remove_slash
setopt COMPLETE_ALIASES
setopt automenu
setopt autolist
setopt complete_in_word
setopt always_to_end
#setopt menucomplete

fpath=(~/.zsh/completion $fpath)

### Prompt

#autoload -Uz promptinit && promptinit
#prompt gentoo
source ~/.zsh/themes/distroprompt.zsh

### History

HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_space
setopt hist_ignore_all_dups

### Basic settings

autoload colors
colors
setopt appendhistory
setopt extended_history
setopt clobber
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
setopt multios 
setopt globdots
unsetopt correct_all
unsetopt beep
bindkey -e
autoload -Uz add-zsh-hook
autoload run-help

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
   add-zsh-hook -Uz precmd xterm_title_precmd
   add-zsh-hook -Uz preexec xterm_title_preexec
fi

### Include other files

source $HOME/.zsh/evars.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/private.zsh
source $HOME/.zsh/keybindings.zsh

### Dircolors

if [[ "$(uname)" = "FreeBSD" ]]; then
   eval `gdircolors ~/.zsh/dircolors/jellybeans.dircolors`
else
   eval `dircolors ~/.zsh/dircolors/jellybeans.dircolors`
fi

### Autostart tmux

if [[ -n $DISPLAY ]] && [[ $(id -u) -ne 0 ]] && [[ "$(hostname)" != "server" ]]; then
   [[ $- != *i* ]] && return
   [[ -z "$TMUX" ]] && exec tmux
fi
