#!/bin/bash 
# mjturt

UPTIME=$(uptime | cut -f 4-5 -d " " | tr -d ",")

echo -e "$UPTIME"
