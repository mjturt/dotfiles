#!/bin/sh
# Status script that shows OS-logo from Nerdfonts
# By mjturt

case $(uname) in
   "Linux")
      echo -n " "
      if [ $(cat /etc/*-release | grep Gentoo | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep Arch | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep Debian | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep Slackware | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep Ubuntu | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep Mint | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep suse | wc -l) -gt "0" ]
      then
         echo ""
      elif [ $(cat /etc/*-release | grep RHEL | wc -l) -gt "0" ]
      then
         echo ""
      fi
   ;;
   "FreeBSD")
      echo ""
   ;;
   "Darwin")
      echo ""
   ;;
   "WindowsNT")
      echo ""
   ;;
esac
