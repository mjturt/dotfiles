#!/usr/bin/env bash
# Rofi power menu that does not need systemd by mjturt
# Based on Oliver Kraitschy's power.sh script 
# Dependencies: rofi, lxqt-sudo, i3lock

if [[ "$1" = "tp" ]]; then
   OPTIONS="Lock\nExit\ntpReboot\ntpHalt\nSuspend"
else
   OPTIONS="Lock\nExit\nReboot\nHalt"
fi

LAUNCHER="rofi -width 30 -dmenu -i -p rofi-power:"

option=`echo -e $OPTIONS | $LAUNCHER | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
   case $option in
   Lock)
      lock
      ;;
   Exit)
      bspc quit
      ;;
   Reboot)
      lxqt-sudo reboot
      ;;
   Halt)
      lxqt-sudo halt
      ;;
   tpReboot)
      systemctl reboot
      ;;
   tpHalt)
      systemctl halt
      ;;
   Suspend)
      suspend
      ;;
   *)
      ;;
   esac
fi
