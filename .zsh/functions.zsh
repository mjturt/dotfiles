#┃ ~/.zsh/functions.zsh
#┣━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

# Extension lowering
function lowerextensions() {
   autoload zmv
   zmv '(**/)(*).(#i)jpg' '$1$2.jpg'
   zmv '(**/)(*).(#i)png' '$1$2.png'
   zmv '(**/)(*).(#i)pdf' '$1$2.pdf'
   zmv '(**/)(*).(#i)mp3' '$1$2.mp3'
}

# Xterm/rxvt title changing functions
function xterm_title_precmd () {
   print -Pn '\e]2;%n@%m %1~ - \a'
}

function xterm_title_preexec () {
   print -Pn '\e]2;%n@%m %1~ %# '
   print -n "${(q)1}\a"
}

# ZSH auto rehash
function _force_rehash () {
   (( CURRENT == 1 )) && rehash
   return 1
}

# C-y to delete last word in shell
backward-delete-to-slash () {
   local WORDCHARS=${WORDCHARS//\//}
   zle .backward-delete-word
}

# C-x-s to put sudo before the command in the shell
run-with-sudo() { LBUFFER="sudo $LBUFFER" }

# man page colors
man() {
   LESS_TERMCAP_md=$'\e[01;31m' \
      LESS_TERMCAP_me=$'\e[0m' \
      LESS_TERMCAP_se=$'\e[0m' \
      LESS_TERMCAP_so=$'\e[01;103;30m' \
      LESS_TERMCAP_ue=$'\e[0m' \
      LESS_TERMCAP_us=$'\e[01;32m' \
      command man "$@"
}

# Ranger startup script
# Preventing nested sessions and changes shell directory to same as ranger
ranger-cd() {
   if [[ -z "$RANGER_LEVEL" ]]; then
      tempfile="$(mktemp -t tmp.XXXXXX)"
      ranger --choosedir="$tempfile" "${@:-$(pwd)}"
      test -f "$tempfile" && if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
         cd -- "$(cat "$tempfile")"
      fi
      rm -f -- "$tempfile"
   else
      exit
   fi
}


# fff automatic cd
fff-cd() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# lf automatic cd
lf-cd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# nnn automatic cd
nnn-cd()
{
    export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm $NNN_TMPFILE
    fi
}

# activate python virtualenv
function ve() {
    source "$HOME"/.virtualenvs/"$1"/bin/activate
}
