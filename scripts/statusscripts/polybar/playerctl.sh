#!/bin/sh

player_status=$(playerctl --player=spotify status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "%{F#719611}%{F-} $(playerctl --player=spotify metadata artist 2> /dev/null | cut -c 1-20) - $(playerctl --player=spotify metadata title 2> /dev/null | cut -c 1-20)"
elif [ "$player_status" = "Paused" ]; then
    echo "%{F#aa4450}%{F-} $(playerctl --player=spotify metadata artist 2> /dev/null | cut -c 1-20) - $(playerctl --player=spotify metadata title 2> /dev/null | cut -c 1-20)"
else
    echo "%{F#FFB402}%{F-}"
fi
