#┃ ~/.xinitrc
#┣━━━━━━━━━━━
#┃ mjturt

export _JAVA_AWT_WM_NONREPARENTING=1

## Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Autostart programs
setxkbmap fi
xbindkeys
xsetroot -cursor_name left_ptr
#xsetroot -solid "#2D303B"
# setroot --on 0 -sc "#2B303B" # --on 1 -sc  "#2B303B"
~/.fehbg &

#locktimer r5 &
dunst &
# twmnd &
picom -b --experimental-backends &
#nextcloud &
#blueberry-tray &
rambox &
#steam &
#nitrogen --restore &
#redshift -l 60.46:22.29 &
greenclip daemon &
mopidy-start &
spotify &
ssh-irc-notifier &

## Window manager
i3c &
sleep 1
i3
