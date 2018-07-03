#!/bin/bash
# Clickable Herbstluftwm tags for polybar/lemonbar
# mjturt
# Based on dzen script by Florian Bruhin <me@the-compiler.org>

herbstclient --idle 2>/dev/null | {
   tags=( $(herbstclient tag_status) )
   while true; do
      for tag in "${tags[@]}" ; do
         case ${tag:0:1} in
            '#') cstart="%{F#87875f U#87875f +u}" ;;
            '-') cstart="%{F#6688aa U#6688aa +u}" ;;
            '+') cstart="%{F#87875f}" ;;
            ':') cstart="%{F#87875f}" ;;
            '!') cstart="%{F#ff5555}" ;;
            *)   cstart='%{F#c2c2b0}' ;;
         esac
         baroutput="%{A1:herbstclient use ${tag:1}:}${cstart} ${tag:1} %{B -u}%{A}"
         echo -n "$baroutput"
      done
      echo 
      read hook || exit
      case "$hook" in
         tag*) tags=( $(herbstclient tag_status) ) ;;
         quit_panel*) exit ;;
      esac
   done
}
