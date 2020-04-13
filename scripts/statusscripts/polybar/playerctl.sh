#!/bin/sh

player_status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$1" = "--show-info" ]; then
    if [ "$player_status" = "Playing" ]; then
        echo "%{F#00ff00}%{F-} $(playerctl --player=spotify metadata artist 2>/dev/null | cut -c 1-20) - $(playerctl --player=spotify metadata title 2>/dev/null | cut -c 1-20)"
    elif [ "$player_status" = "Paused" ]; then
        echo "%{F#f57800}%{F-} $(playerctl --player=spotify metadata artist 2>/dev/null | cut -c 1-20) - $(playerctl --player=spotify metadata title 2>/dev/null | cut -c 1-20)"
    else
        echo "%{F#ff0000}%{F-}"
    fi
else
    if [ "$player_status" = "Playing" ]; then
        echo "%{F#00ff00}%{F-}"
    elif [ "$player_status" = "Paused" ]; then
        echo "%{F#f57800}%{F-}"
    else
        echo "%{F#ff0000}%{F-}"
    fi
fi
