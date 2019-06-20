#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "%{F#719611}%{F-} $(playerctl metadata artist 2> /dev/null | cut -c 1-20) - $(playerctl metadata title 2> /dev/null | cut -c 1-20)"
elif [ "$player_status" = "Paused" ]; then
    echo "%{F#aa4450}%{F-} $(playerctl metadata artist 2> /dev/null | cut -c 1-20) - $(playerctl metadata title 2> /dev/null | cut -c 1-20)"
else
    echo "%{F#FFB402}%{F-}"
fi
