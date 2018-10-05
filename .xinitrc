#┃ ~/.xinitrc
#┣━━━━━━━━━━━
#┃ mjturt

## Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Autostart programs
setxkbmap fi
xbindkeys
xsetroot -cursor_name left_ptr
setroot --on 0 -sc "#2B303B" --on 1 -sc  "#2B303B"
#setroot --bg-color \#2D3335 --on 0 -f ~/cloud/images/wallpapers/linux/vim.png --bg-color \#2D3335 --on 1 -f ~/cloud/images/wallpapers/linux/vim.png

locktimer r5 &
dunst &
compton -b &
nextcloud &
blueberry-tray &
rambox &
steam &
#nitrogen --restore &
redshift -l 60.46:22.29 &

## Window manager
exec bspwm
