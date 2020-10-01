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

locktimer &
dunst &
picomtoggle &
nm-applet &
# setroot --span --blank-color "#2B303B"
~/.fehbg &
greenclip daemon &
ssh-irc-notifier &

# Fonts
xset +fp /usr/share/fonts
xset fp rehash
sudo fc-cache -fs

## Window manager
i3.config &
i3
