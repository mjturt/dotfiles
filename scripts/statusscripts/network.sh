#!/bin/bash
# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>
# Copyright (C) 2014 Alexander Keller <github@nycroth.com>
# Copyright (C) 2012 Stefan Breunig <stefan+measure-net-speed@mathphys.fsk.uni-heidelberg.de>
# Copyright (C) 2014 kaueraal
# Copyright (C) 2015 Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# GPLv3
# Merged and modified scripts from i3blocks
# Modifications by mjturt

# Shows IP or "down" and up/down speed

# Interface part

# Use the provided interface, otherwise the device used for the default route.
#if [[ -n $BLOCK_INSTANCE ]]; then
  #IF=$BLOCK_INSTANCE
  #IF=$BLOCK_INSTANCE
#else
  #IF=$(ip route | awk '/^default/ { print $5 ; exit }')
#fi

IF=eth0
echo -n " "

#------------------------------------------------------------------------

# As per #36 -- It is transparent: e.g. if the machine has no battery or wireless
# connection (think desktop), the corresponding block should not be displayed.
[[ ! -d /sys/class/net/${IF} ]] && exit

#------------------------------------------------------------------------

if [[ "$(cat /sys/class/net/$IF/operstate)" = 'down' ]]; then
  echo down # full text
  echo down # short text
  echo \#FF0000 # color
  exit
fi

case $1 in
  -4)
    AF=inet ;;
  -6)
    AF=inet6 ;;
  *)
    AF=inet6? ;;
esac

# if no interface is found, use the first device with a global scope
IPADDR=$(ip addr show $IF | perl -n -e "/$AF ([^\/]+).* scope global/ && print \$1 and exit")

case $BLOCK_BUTTON in
  3) echo -n "$IPADDR" | xclip -q -se c ;;
esac


# Bandwidth part

# Issue #36 compliant.
if ! [ -e "/sys/class/net/${IF}/operstate" ] || ! [ "`cat /sys/class/net/${IF}/operstate`" = "up" ]
then
    echo "$IF down"
    echo "$IF down"
    echo "#FF0000"
    exit 0
fi

# path to store the old results in
path="/dev/shm/$(basename $0)-${IF}"

# grabbing data for each adapter.
read rx < "/sys/class/net/${IF}/statistics/rx_bytes"
read tx < "/sys/class/net/${IF}/statistics/tx_bytes"

# get time
time=$(date +%s)

# write current data if file does not exist. Do not exit, this will cause
# problems if this file is sourced instead of executed as another process.
if ! [[ -f "${path}" ]]; then
  echo "${time} ${rx} ${tx}" > "${path}"
  chmod 0666 "${path}"
fi

# read previous state and update data storage
read old < "${path}"
echo "${time} ${rx} ${tx}" > "${path}"

# parse old data and calc time passed
old=(${old//;/ })
time_diff=$(( $time - ${old[0]} ))

# sanity check: has a positive amount of time passed
[[ "${time_diff}" -gt 0 ]] || exit

# calc bytes transferred, and their rate in byte/s
rx_diff=$(( $rx - ${old[1]} ))
tx_diff=$(( $tx - ${old[2]} ))
rx_rate=$(( $rx_diff / $time_diff ))
tx_rate=$(( $tx_diff / $time_diff ))

# IP-address

echo -n "$IPADDR " # full text

# shift by 10 bytes to get KiB/s. If the value is larger than
# 1024^2 = 1048576, then display MiB/s instead

# incoming
echo -n " "
rx_kib=$(( $rx_rate >> 10 ))
if [[ "$rx_rate" -gt 1048576 ]]; then
  printf '%sM' "`echo "scale=1; $rx_kib / 1024" | bc`"
else
  echo -n "${rx_kib}K"
fi

echo -n " "

# outgoing
echo -n " "
tx_kib=$(( $tx_rate >> 10 ))
if [[ "$tx_rate" -gt 1048576 ]]; then
  printf '%sM' "`echo "scale=1; $tx_kib / 1024" | bc`"
else
  echo -n "${tx_kib}K"
fi
