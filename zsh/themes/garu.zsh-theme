# Modified version of karu zsh theme by zaari
# mjturt

# Current working directory for the prompt
karu_theme_dir() {
  if [[ "$(pwd)" != "$HOME" ]] ; then
    echo -n "%."
  fi
}

# Privilege symbol
karu_theme_privilege_symbol() {
  if [[ $EUID == 0 ]] ; then
    #echo -n "×"
    #echo -n "%B%F{yellow}"
    echo -n "%B%F{yellow}"
  else
    stat_ret=( $(stat -Lc "%a %G %U" "`pwd`") )
    local stat_perm=${stat_ret[1]}
    local stat_owner=${stat_ret[3]}

    if [[ $(( $stat_perm[-1] & 2 )) != 0 ]]; then
      echo -n "%B%F{blue}"
    elif [[ $stat_owner == $USER ]] ; then
      #echo -n "»"
      #echo -n ""
      #echo -n ""
      echo -n ""
    else
      echo -n "›"
      #echo -n ""
    fi
  fi
}

karu_theme_git_symbol() {
  # HEAD test and branch name
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  local current_branch="${ref#refs/heads/}"

  # Ahead, behind and dirtyness tests
  if [[ -n "$(command git rev-list origin/${current_branch}..HEAD 2> /dev/null)" ]]; then
    echo -n "$ZSH_THEME_GIT_PROMPT_AHEAD"
  elif [[ -n "$(command git rev-list HEAD..origin/${current_branch} 2> /dev/null)" ]]; then
    echo -n "$ZSH_THEME_GIT_PROMPT_BEHIND"
  else
    git diff-index --quiet HEAD -- 2>/dev/null
    if [[ $? -ne 0 ]] ; then
      echo -n "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
      if [[ "$KARU_THEME_SHOW_DIR" == "right" ]] ; then
        echo -n "$ZSH_THEME_GIT_PROMPT_CLEAN"
      fi 
    fi
  fi
  
  # Branch name
  echo "${current_branch}"
}

# Executed before each prompt
precmd() {
  local karu_exit_color="%(?.${KARU_THEME_LEFT_PROMPT_COLOR}.${KARU_THEME_ERROR_COLOR})"  

  # Updste terminal title (useful on remote hosts)
  print -Pn "\e]0;%n@%m:%/\a"  

  # Directory name placement
  if [[ "$KARU_THEME_SHOW_DIR" == "left" ]] ; then
    local dir_left="$(karu_theme_dir)"
  elif [[ "$KARU_THEME_SHOW_DIR" == "right" ]] ; then
    local dir_right="$(karu_theme_dir)"
  fi
  
  # Main prompt (PS1)
  PROMPT="${KARU_THEME_LEFT_PROMPT_COLOR}${dir_left}${karu_exit_color}$(karu_theme_privilege_symbol) %b%f"

  # Right prompt
  RPROMPT="${KARU_THEME_RIGHT_PROMPT_COLOR}${dir_right}$(karu_theme_git_symbol)%b%f"
}

ZSH_THEME_GIT_PROMPT_PREFIX=
ZSH_THEME_GIT_PROMPT_SUFFIX=
ZSH_THEME_GIT_PROMPT_DIRTY=" × "
ZSH_THEME_GIT_PROMPT_CLEAN=" · "
ZSH_THEME_GIT_PROMPT_AHEAD=" ↑ "
ZSH_THEME_GIT_PROMPT_BEHIND=" ↓ "

# User-defineable variables
(( ${+KARU_THEME_LEFT_PROMPT_COLOR}  )) || KARU_THEME_LEFT_PROMPT_COLOR="%B%F{cyan}"
(( ${+KARU_THEME_RIGHT_PROMPT_COLOR} )) || KARU_THEME_RIGHT_PROMPT_COLOR="%B%F{cyan}"
(( ${+KARU_THEME_ERROR_COLOR}        )) || KARU_THEME_ERROR_COLOR="%B%F{red}"
(( ${+KARU_THEME_SHOW_DIR}           )) || KARU_THEME_SHOW_DIR="right" # left, right or off

