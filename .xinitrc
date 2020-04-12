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
setroot --bg-color \#2D3335 --on 0 -f ~/cloud/images/wallpapers/cyberpunk/wallhaven-p8pylp.jpg --bg-color \#2D3335 --on 1 -f ~/cloud/images/wallpapers/cyberpunk/wallhaven-p8pylp.jpg

#locktimer r5 &
dunst &
# twmnd &
compton -b &
#nextcloud &
#blueberry-tray &
rambox &
#steam &
#nitrogen --restore &
#redshift -l 60.46:22.29 &
greenclip daemon &
mopidy-start &
spotify &

## Window manager
i3
poly
