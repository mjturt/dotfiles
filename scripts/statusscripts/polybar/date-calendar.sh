#!/bin/bash
# Date script for polybar/lemonbar with popup calendar
# Dependencies: Yad (https://sourceforge.net/projects/yad-dialog/), xdotool
# by mjturt

width=200
height=200
# if used bottom panel
bottom=1

date=$(date +"%a %d %H:%M")
echo $date
if [[ $1 = "click" ]]; then
   eval $(xdotool getmouselocation --shell)
   if [[ $bottom -eq 1 ]]; then
      let "posy = $Y - $height - 20"
      let "posx = $X - ($width / 2)"
   else
      let "posy = $Y + 20"
      let "posx = $X - ($width / 2)"
   fi
   yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons --width=${width} --height=${height} --posx=${posx} --posy=${posy} > /dev/null
fi
