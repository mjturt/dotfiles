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
xrandr --output HDMI-0 --primary --auto --output DVI-I-1 --auto --right-of HDMI-0
~/.fehbg &

#locktimer r5 &
dunst &
picom -b --experimental-backends &
greenclip daemon &
spotify &
ssh-irc-notifier &

whatsapp-nativefier-dark &
discord-canary &
slack &
telegram-desktop &

sudo fc-cache -fs

## Window manager
i3.config &
i3
