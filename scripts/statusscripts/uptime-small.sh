#!/bin/bash 

UPTIME=$(uptime | cut -f 4-5 -d " " | sed "s/days,/days/")

echo -e " $UPTIME"
