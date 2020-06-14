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
~/.fehbg &

#locktimer r5 &
dunst &
picom -b --experimental-backends &
greenclip daemon &
spotify &
ssh-irc-notifier &

## Window manager
i3c &
sleep 1
i3
