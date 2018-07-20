#!/bin/bash
# mjturt

device="wlan0"
status=$(cat /sys/class/net/${device}/operstate)

if [ "${status}" == "up" ]
then
   echo  U
else
   echo  D
   echo  D
   echo \#FF0000
   exit
fi
