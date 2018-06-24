#!/usr/bin/env bash
# Syncs from imap and nends notification-sound over ssh when there is a new mail
# This is runned as a cron job
# based on LukeSmithxyz:s script

offlineimap -o

for account in $(ls ~/mail)
do
   newcount=$(find ~/mail/$account/INBOX/new/ -type f -newer ~/.mutt/lastsync 2> /dev/null | wc -l)
   if [ "$newcount" -gt "0" ]
   then
      ssh mjt@r5.turtia.com mpv --quiet /home/mjt/.notify.opus
   fi
done

touch ~/.mutt/lastsync
