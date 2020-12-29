#┃ ~/.zshrc
#┣━━━━━━━━━
#┃ mjturt

OS="$(uname)"

### Plugins

if [[ ! -f $HOME/bin/antibody ]]; then
    curl -sL git.io/antibody | sudo sh -s
    antibody bundle < ~/.zsh/plugins > ~/.cache/zsh/plugins.sh
fi

# https://github.com/denysdovhan/spaceship-prompt/issues/407
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

source ~/.cache/zsh/plugins.sh

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
zstyle ':completion:*' cache-path ~/.cache/zsh

setopt auto_remove_slash
setopt COMPLETE_ALIASES
setopt automenu
setopt autolist
setopt complete_in_word
setopt always_to_end
#setopt menucomplete

fpath=(~/.zsh/site-functions $fpath)

### Prompt

# if [[ ! -L ~/.zsh/site-functions/prompt_pure_setup ]]; then
# ln -v -s ~/.zsh/themes/pure/pure.zsh ~/.zsh/site-functions/prompt_pure_setup
# fi
# if [[ ! -L ~/.zsh/site-functions/async ]]; then
# ln -v -s ~/.zsh/themes/pure/async.zsh ~/.zsh/site-functions/async
# fi

## Prompt set by antibody
#autoload -Uz promptinit && promptinit
#prompt pure
#source ~/.zsh/themes/distroprompt.zsh
#source ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-geometry-zsh-SLASH-geometry/geometry.zsh

### History

HISTFILE=~/.cache/zsh/history
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

DIRSTACKFILE="${HOME}/.cache/zsh/dirs"
# if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
    # dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
    # [[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
# fi
chpwd_dirstack() {
    print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

### Include other files

source $HOME/.zsh/evars.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/private.zsh
source $HOME/.zsh/keybindings.zsh
source $HOME/.zsh/themes/spaceship-settings.zsh

### Dircolors

if [[ "$OS" = "FreeBSD" ]]; then
    eval `gdircolors ~/.zsh/dircolors/nord.dircolors`
else
    eval `dircolors ~/.zsh/dircolors/nord.dircolors`
fi

if [[ "$OS" == "Linux" ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

### Remove some useless files
rm -rf ~/dbus-send.core

# Pyenv
if [[ "$OS" != "FreeBSD" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi
  eval "$(pyenv virtualenv-init -)"
fi
