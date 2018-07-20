#!/bin/bash 
# mjturt

temp=$(sensors | grep "^temp" | awk '{print $2}' | tr -d "+" )

echo -e "$temp"
