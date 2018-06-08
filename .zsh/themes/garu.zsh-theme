# Garu ZSH prompt theme by mjturt
# Based on Karu prompt theme by zaari

# Current working directory for the prompt
garu_theme_dir() {
  if [[ "$(pwd)" != "$HOME" ]] ; then
    echo -n "%."
  fi
}

# Privilege symbol
garu_theme_privilege_symbol() {
  if [[ $EUID == 0 ]] ; then
    echo -n "%B%F{228}"
  else
    stat_ret=( $(stat -Lc "%a %G %U" "`pwd`") )
    local stat_perm=${stat_ret[1]}
    local stat_owner=${stat_ret[3]}

    if [[ $(( $stat_perm[-1] & 2 )) != 0 ]]; then
      echo -n "%B%F{141}"
    elif [[ $stat_owner == $USER ]] ; then
      #echo -n "%K{61}%F{212}  %F{61}%k%F{84}%k"
      echo -n "%B%F{212}"
    else
      echo -n "%B%F{203}"
    fi
  fi
}

garu_theme_status_symbol() {
   echo -n " "
}

garu_theme_git_symbol() {
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
      if [[ "$garu_THEME_SHOW_DIR" == "right" ]] ; then
        echo -n "$ZSH_THEME_GIT_PROMPT_CLEAN"
      fi 
    fi
  fi
  
  # Branch name
  echo "${current_branch}"
}

# Executed before each prompt
precmd() {
  local garu_exit_color="%(?.${garu_THEME_NOERROR_COLOR}.${garu_THEME_ERROR_COLOR})"  

  # Updste terminal title (useful on remote hosts)
  print -Pn "\e]0;%n@%m:%/\a"  

  # Directory name placement
  if [[ "$garu_THEME_SHOW_DIR" == "left" ]] ; then
    local dir_left="$(garu_theme_dir)"
  elif [[ "$garu_THEME_SHOW_DIR" == "right" ]] ; then
    local dir_right="$(garu_theme_dir)"
  fi
  
  # Main prompt (PS1)
  PROMPT="${garu_THEME_LEFT_PROMPT_COLOR}${dir_left}$(garu_theme_privilege_symbol)${garu_exit_color}$(garu_theme_status_symbol) %b%f"

  # Right prompt
  RPROMPT="${garu_THEME_RIGHT_PROMPT_COLOR}${dir_right}$(garu_theme_git_symbol)%b%f"
}

ZSH_THEME_GIT_PROMPT_PREFIX=
ZSH_THEME_GIT_PROMPT_SUFFIX=
ZSH_THEME_GIT_PROMPT_DIRTY=" × "
ZSH_THEME_GIT_PROMPT_CLEAN=" · "
ZSH_THEME_GIT_PROMPT_AHEAD=" ↑ "
ZSH_THEME_GIT_PROMPT_BEHIND=" ↓ "

# User-defineable variables
(( ${+garu_THEME_LEFT_PROMPT_COLOR}  )) || garu_THEME_LEFT_PROMPT_COLOR="%B%F{212}"
(( ${+garu_THEME_RIGHT_PROMPT_COLOR} )) || garu_THEME_RIGHT_PROMPT_COLOR="%B%F{84}"
(( ${+garu_THEME_ERROR_COLOR}        )) || garu_THEME_ERROR_COLOR="%B%F{203}"
(( ${+garu_THEME_NOERROR_COLOR}      )) || garu_THEME_NOERROR_COLOR="%B%F{84}"
(( ${+garu_THEME_SHOW_DIR}           )) || garu_THEME_SHOW_DIR="right" # left, right or off

