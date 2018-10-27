#┃ ~/.zprofile (R5 & tp)
#┣━━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

export LC_TIME="fi_FI.utf8"
export BROWSER="qutebrowser"

if [[ -z $DISPLAY && ! -e /tmp/.X11-unix/X0 ]]; then
   #exec startx
fi

# Console colors

if [ "$TERM" = "linux" ]; then
   source ~/.fbcolors/praiso
   #fb
fi
