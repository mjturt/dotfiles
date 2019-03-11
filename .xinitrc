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
setroot --on 0 -sc "#2B303B" # --on 1 -sc  "#2B303B"
#setroot --bg-color \#2D3335 --on 0 -f ~/cloud/images/wallpapers/linux/vim.png --bg-color \#2D3335 --on 1 -f ~/cloud/images/wallpapers/linux/vim.png

#locktimer r5 &
dunst &
compton -b &
#nextcloud &
#blueberry-tray &
rambox-bin &
#steam &
#nitrogen --restore &
#redshift -l 60.46:22.29 &
greenclip daemon &

## Window manager
exec bspwm
