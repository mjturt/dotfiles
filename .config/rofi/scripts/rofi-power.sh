#!/usr/bin/env bash
# Rofi power menu for i3 that does not need systemd by mjturt
# Based on Oliver Kraitschy's power.sh script 
# Dependencies: rofi, lxqt-sudo, i3lock

OPTIONS="Lock\nExit\nReboot\nHalt"
LAUNCHER="rofi -width 30 -dmenu -i -p rofi-power:"

option=`echo -e $OPTIONS | $LAUNCHER | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
   case $option in
   Lock)
      i3lock -c 282a36
      ;;
   Exit)
      i3-msg exit
      ;;
   Reboot)
      lxqt-sudo reboot
      ;;
   Halt)
      lxqt-sudo halt
      ;;
   *)
      ;;
   esac
fi
