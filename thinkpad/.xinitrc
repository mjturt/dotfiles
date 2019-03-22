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
#nextcloud &
rambox &
nm-applet &
setroot --on 0 -sc "#2B303B"

## Window manager
exec bspwm

export _JAVA_AWT_WM_NONREPARENTING=1
