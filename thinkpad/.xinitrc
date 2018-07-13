#┃ ~/.xinitrc (Thinkpad)
#┣━━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

## Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Autostart programs
setxkbmap fi
xbindkeys
xsetroot -cursor_name left_ptr
xmodmap ~/.Xmodmap

locktimer thinkpad &
dunst &
compton -b &
nextcloud &
rambox &
hsetroot -solid "#2B303B"

## Window manager
exec bspwm
