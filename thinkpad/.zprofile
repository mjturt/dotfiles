export PATH="$PATH:$HOME/bin"
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; 
then
  exec startx
fi
QT_QPA_PLATFORMTHEME=qt5ct 
