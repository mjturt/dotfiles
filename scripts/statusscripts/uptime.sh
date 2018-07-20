#!/bin/bash 
# mjturt

UPTIME=$(uptime -p | sed "s/hour/H/" | sed "s/minutes/M/" | sed "s/up //")

echo -e " $UPTIME "
