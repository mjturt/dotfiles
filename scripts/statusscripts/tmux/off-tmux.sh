#!/bin/sh
# Tmux OFF-indicator by mjturt

if [ $(tmux show-option -qv key-table | wc -c) -gt 0 ]
then
   if [ "$(tmux show-option -qv key-table)" = "off" ]
   then
      echo "OFF"
   fi
fi
