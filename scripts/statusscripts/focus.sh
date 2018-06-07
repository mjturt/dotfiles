#!/bin/bash

focus=$(xdotool getactivewindow getwindowname)
focus_Number=$(xdotool getactivewindow getwindowname | wc -c)
Focus_N=$(xdotool getactivewindow getwindowname | head -c 25 | iconv -c )

if [ "$focus" = "" ];then
    echo -e " i3"
else
    if [ "$focus_Number" -gt "25" ];then
        echo -e " $Focus_N ..."
    else
        echo -e " $focus"
    fi
fi
