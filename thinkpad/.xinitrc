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
~/.fehbg &
greenclip daemon &

## Window manager
i3c &
i3

export _JAVA_AWT_WM_NONREPARENTING=1
