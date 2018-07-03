#!/bin/sh
# Tmux statusline script that shows changing system status information
# By mjturt

# Example: set -g status-right "#(~/.statusscripts/status-tmux.sh)"

if [[ ! -e ~/.cache ]]; then
   mkdir ~/.cache
fi

tempfile=~/.cache/tmux-status.tmp

if [ ! -f $tempfile ]
then
   echo "#[fg=yellow] $(cut -d " " -f 1 /proc/loadavg)"
   echo "2" > $tempfile
else
   case $(cat $tempfile) in
   1*)
      echo "#[fg=yellow] $(cut -d " " -f 1 /proc/loadavg)"
      echo "2" > $tempfile
      ;;
   2*)
      echo "#[fg=blue] $(df -h -P --total | tail -1 | awk '{ print $4 }')"
      echo "3" > $tempfile
      ;;
   3*)
      echo "#[fg=red] $(mpstat -u | grep "all" | awk '{print int($4)" %"}')"
      echo "4" > $tempfile
      ;;
   4*)
      echo "#[fg=colour199] $(uptime | cut -f 4-5 -d ' ' | sed 's/days,/d/' | sed 's/hours,/h/' | tr -d , )"
      echo "5" > $tempfile
      ;;
   5*)
      if [ $(sensors | grep "DIMM" | awk '{print $5}' | head -1 | wc -c) -ne 0 ];
      then
         echo "#[fg=colour082] $(sensors | grep "DIMM" | awk '{print int($5)}' | head -1)°C"
      else
         echo "#[fg=colour082] $(sensors | grep "temp1" | awk '{print int($2)}' | head -1)°C"
      fi
      echo "1" > $tempfile
      ;;
   esac
fi
