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
spotify &
nm-applet &
# setroot --span --blank-color "#2B303B"
~/.fehbg &
greenclip daemon &
ssh-irc-notifier &

whatsapp-nativefier-dark &
discord-canary &
slack &
telegram-desktop &
termite.mutt &
termite.weechat &

## Window manager
i3.config &
i3.layour &
i3
