#!/usr/bin/env bash
# Cmus status script from i3blocks-contrib I think
# Modified for polybar/lemonbar

info=$(cmus-remote -Q 2> /dev/null)

if [ "$?" -ne 0 ]; then
  echo ""
  exit 0
fi

status=$(echo "$info" | grep "^status " | cut -d " " -f 2)
artist=$(echo "$info" | grep "^tag artist " | tail -c +12)
title=$(echo "$info" | grep "^tag title " | tail -c +11)

if [ "$status" == "paused" ]; then
  icon="%{F#aa4450}%{F-}"
elif [ "$status" == "stopped" ]; then
  echo ""
  exit 0
else
  icon="%{F#719611}%{F-}"
fi

echo "$icon $title"
