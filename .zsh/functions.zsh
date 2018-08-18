# ZSH functions
# mjtrurt

function ranger-cd {
   tempfile="$(mktemp -t tmp.XXXXXX)"
   ranger --choosedir="$tempfile" "${@:-$(pwd)}"
   test -f "$tempfile" && if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
   fi
   rm -f -- "$tempfile"
}

function lowerextensions() {
   autoload zmv
   zmv '(**/)(*).(#i)jpg' '$1$2.jpg'
   zmv '(**/)(*).(#i)png' '$1$2.png'
   zmv '(**/)(*).(#i)pdf' '$1$2.pdf'
   zmv '(**/)(*).(#i)mp3' '$1$2.mp3'
}

function extract () {
   if [ -f $1 ] ; then
      case $1 in
      *.tar.bz2)  tar         xjf   $1;;
      *.tar.gz)   tar         xzf   $1;;
      *.bz2)      bunzip2           $1;;
      *.rar)      rar         x     $1;;
      *.gz)       gunzip            $1;;
      *.tar)      tar         xf    $1;;
      *.tbz2)     tar         xjf   $1;;
      *.tgz)      tar         xzf   $1;;
      *.zip)      unzip             $1;;
      *.Z)        uncompress        $1;;
      *.tar.xz)   tar         xJf   $1;;
      *.xz)       xz          -d    $1;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

function xterm_title_precmd () {
   print -Pn '\e]2;%n@%m %1~ - \a'
}

function xterm_title_preexec () {
   print -Pn '\e]2;%n@%m %1~ %# '
   print -n "${(q)1}\a"
}

man() {
   LESS_TERMCAP_md=$'\e[01;31m' \
      LESS_TERMCAP_me=$'\e[0m' \
      LESS_TERMCAP_se=$'\e[0m' \
      LESS_TERMCAP_so=$'\e[01;103;30m' \
      LESS_TERMCAP_ue=$'\e[0m' \
      LESS_TERMCAP_us=$'\e[01;32m' \
      command man "$@"
}

function _force_rehash () {
   (( CURRENT == 1 )) && rehash
   return 1
}

shebang() {
    if i=$(which $1);
    then
        printf '#!/usr/bin/env %s\n\n' $1 > $2 && chmod 755 $2 && vim + $2 && chmod 755 $2;
    else
        echo "'which' could not find $1, is it in your \$PATH?";
    fi;
    rehash
}

newdot () {
    printf '#┃ %s\n#┣━━━━━━━━━━━━━━\n#┃ mjturt\n\n' $1 > $1 && vim + $1;
}

screenshot() {
   scrot 'screenshot_%d-%m-%Y_%H%M%S_$wx$h.png' -e 'mv $f ~/cloud/images/screenshots/'
}

# C-y
backward-delete-to-slash () {
  local WORDCHARS=${WORDCHARS//\//}
  zle .backward-delete-word
}

pack () {
    name=$1;
    if [ "$name" != "" ]; then
        tar cvjf $1.tar.bz2 $1
    fi
}

buf () {
    oldname=$1;
    if [ "$oldname" != "" ]; then
        datepart=$(date +%Y-%m-%d);
        firstpart=`echo $oldname | cut -d "." -f 1`;
        newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`;
        cp -R ${oldname} ${newname};
        tar cvjf $newname.tar.bz2 $newname
        rm -rf $newname
        if [[ -e /mnt/storage ]]; then
            mv $newname.tar.bz2 /mnt/storage/backup/buf
        elif [[ -e /storage ]]; then
            mv $newname.tar.bz2 /storage/backup/buf
        fi
    fi
}

buftemp () {
    oldname=$1;
    if [ "$oldname" != "" ]; then
        datepart=$(date +%Y-%m-%d);
        firstpart=`echo $oldname | cut -d "." -f 1`;
        newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`;
        cp -R ${oldname} ${newname};
    fi
}

# C-x-s
run-with-sudo() { LBUFFER="sudo $LBUFFER" }
