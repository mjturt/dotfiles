# ~/.zprofile (R5)
# ----------------
# mjturt

export PATH="$PATH:$HOME/bin/:$HOME/.cargo/bin/"

if [[ -z $DISPLAY && ! -e /tmp/.X11-unix/X0 ]]; then
   #exec startx
fi

# Console colors

if [ "$TERM" = "linux" ]; then
   source ~/.fbcolors/sourcerer
   #fb
fi
