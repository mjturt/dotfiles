#!/bin/bash
# Simple date script based on example polybar script
t=0

toggle() {
    t=$(((t + 1) % 2))
}


trap 'toggle' SIGUSR1

while true; do
    if [ $t -eq 0 ]; then
        date +"%H:%M"
    else
        date +"%a %d.%m.%Y %H:%M:%S"
    fi
    sleep 1 &
    wait
done
