#!/bin/sh
# Tmux statusline script that shows OS-logo using icons from Nerdfonts (https://github.com/ryanoasis/nerd-fonts)
# By mjturt

# Example: set -g status-right "#(~/.tmux/scripts/distro-tmux.sh)"

case $(uname) in
   "Linux")
      echo -n "#[fg=colour232,bold] "
      if [ $(cat /etc/*-release | grep Gentoo | wc -l) -gt "0" ]
      then
         echo "#[fg=colour063]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep Arch | wc -l) -gt "0" ]
      then
         echo "#[fg=colour033]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep Debian | wc -l) -gt "0" ]
      then
         echo "#[fg=colour052]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep Slackware | wc -l) -gt "0" ]
      then
         echo "#[fg=colour004]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep Ubuntu | wc -l) -gt "0" ]
      then
         echo "#[fg=colour166]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep Mint | wc -l) -gt "0" ]
      then
         echo "#[fg=colour040]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep suse | wc -l) -gt "0" ]
      then
         echo "#[fg=colour002]#[fg=default,nobold]"
      elif [ $(cat /etc/*-release | grep RHEL | wc -l) -gt "0" ]
      then
         echo "#[fg=colour088]#[fg=default,nobold]"
      fi
   ;;
   "FreeBSD")
      echo "#[fg=colour088,bold]#[fg=default,nobold]"
   ;;
   "Darwin")
      echo "#[fg=colour254,bold]#[fg=default,nobold]"
   ;;
   "WindowsNT")
      echo "#[fg=colour033,bold]#[fg=default,nobold]"
   ;;
esac
