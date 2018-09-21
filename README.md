# dotfiles

This repository is attempt to bring my dotfiles under version controlling. Operating systems in use are Gentoo Linux and FreeBSD.

### Software

+ Text editor:          **Vim**
+ Window manager:       **Bspwm**
+ Panel:                **Polybar**
+ Terminal emulator:    **urxvt**
+ Shell:                **ZSH**
+ Terminal multiplexer: **Tmux**
+ File manager:         **Ranger**
+ Launcher:             **Rofi**
+ Browser:              **qutebrowser**
+ Notification system:  **Dunst**
+ Image viewer:         **Feh**
+ PDF viewer:           **Zathura**
+ Compositor:           **Compton**
+ Video player:         **mpv**
+ Music player:         **cmus**
+ Torrent client:       **rtorrent**
+ Mail client:          **Mutt**

There also config files for GNU less, GNU screen, xbindkeys, xinit, GTK, w3m, GIT, GPG, fbterm, vimb, offlineimap, teiler, sxhkd, i3, i3blocks, herbstluftwm, elinks and for pass and buku rofi-frontends.

### Keybindings

Software that use vim-like keybindings I have remapped HJKL->JKLÖ (Ö is finnish letter, in same place on US-layout is odiaeresis).

![Screenshot](screenshots/screenshot.png?raw=true)

Colors: [Sourcerer](https://github.com/xero/sourcerer).

Fonts: Gohu, ShareTechMono. Patched versions with icons from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

ZSH prompt: [distroprompt-zsh](https://github.com/mjturt/distroprompt-zsh).

### Linux console

Proper kernel and driver support with properly generated initramfs needed to get 1920x1080 resolution support in console(without X11/Wayland). Fbterm (framebuffer terminal emulator) is used to get background image and true type font support. [Startup scrip](scripts/bin/fb).
[Console screenshot](screenshots/console.png?raw=true)

### Scripts

Collection of scripts can be found in [scripts directory](scripts). If I did not write a script, it should be mentioned.

### install.sh

install.sh script is designed for personal use and even though it makes allways backups it is not recommended to use. Help:
```
./install.sh --help
```
