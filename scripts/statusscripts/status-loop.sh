#!/bin/sh
# Changing status
# By mjturt

while [ -n "$TMUX" ]
do
   echo "#[fg=yellow] $(cut -d " " -f 1 /proc/loadavg)" > ~/.tmux/status-tmux-tmp.txt
   sleep 1
   echo "#[fg=blue] $(df -h -P --total | tail -1 | awk '{ print $4 }')" > ~/.tmux/status-tmux-tmp.txt
   sleep 1
   echo "#[fg=red] $(mpstat -u | grep "all" | awk '{print $4"%"}')" > ~/.tmux/status-tmux-tmp.txt
   sleep 1
   echo "#[fg=colour199] $(uptime | cut -f 4-5 -d ' ' | sed 's/days,/days/')" > ~/.tmux/status-tmux-tmp.txt
   sleep 1
   if [ $(sensors | grep "DIMM" | awk '{print $5}' | tr -d "+" | head -1 | wc -c) -ne 0 ];
   then
      echo "#[fg=colour082] $(sensors | grep "DIMM" | awk '{print $5}' | tr -d "+" | head -1)" > ~/.tmux/status-tmux-tmp.txt
      sleep 1
   else
      echo "#[fg=green] $(sensors | grep "Core" | awk '{print $3}' | tr -d "+" | head -1)" > ~/.tmux/status-tmux-tmp.txt
      sleep 1
   fi
done
