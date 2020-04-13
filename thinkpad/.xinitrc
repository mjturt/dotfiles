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
picomtoggle &
rambox &
spotify &
nm-applet &
# setroot --span --blank-color "#2B303B"
setroot --bg-color \#2D3335 --on 0 -f ~/cloud/images/wallpapers/cyberpunk/wallhaven-p8pylp.jpg --bg-color \#2D3335 --on 1 -f ~/cloud/images/wallpapers/cyberpunk/wallhaven-p8pylp.jpg
greenclip daemon &

## Window manager
poly &
i3

export _JAVA_AWT_WM_NONREPARENTING=1
