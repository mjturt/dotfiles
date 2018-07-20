#!/bin/bash 
# Somewhere from the internet

Cpu=$(mpstat -u | grep "all" | awk '{print $4"%"}')

echo -e " $Cpu"
