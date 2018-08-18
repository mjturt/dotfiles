#!/usr/bin/env bash
# Touchpad toggle button for polybar/lemonbar
# mjturt

STATE=$(xinput list-props "SynPS/2 Synaptics TouchPad" | grep "Device Enabled" | cut -f3)

case "$1" in
--toggle)
   if [ $STATE -eq 1 ]; then
      xinput --disable "SynPS/2 Synaptics TouchPad"
   else
      xinput --enable "SynPS/2 Synaptics TouchPad"
   fi
   ;;
*)
   if [ $STATE -eq 1 ]; then
      echo ""
   else
      echo ""
   fi
   ;;
esac
