#┃ ~/.xinitrc
#┣━━━━━━━━━━━
#┃ mjturt

## Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Autostart programs
setxkbmap fi
xbindkeys
xsetroot -cursor_name left_ptr

locktimer r5 &
dunst &
compton -b &
nextcloud &
blueberry-tray &
rambox &
steam &
nitrogen --restore &
redshift -l 60.46:22.29 &

## Window manager
exec bspwm
