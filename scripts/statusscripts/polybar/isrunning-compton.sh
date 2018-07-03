#!/bin/sh
#https://github.com/x70b1/polybar-scripts

case "$1" in
    --toggle)
        if [ "$(pgrep -x compton)" ]; then
            pkill compton
        else
            compton -b
        fi
        ;;
    *)
        if [ "$(pgrep -x compton)" ]; then
            echo ""
        else
            echo ""
        fi
        ;;
esac
