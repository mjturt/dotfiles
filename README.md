# dotfiles

This repository is attempt to bring my dotfiles under version controlling. Operating systems in use are Arch Linux and FreeBSD.

### Software

+ Text editor:          **neovim**
+ Window manager:       **i3**
+ Panel:                **polybar**
+ Terminal emulator:    **termite**
+ Shell:                **zsh**
+ Terminal multiplexer: **tmux**
+ File manager:         **lf**
+ Launcher:             **rofi**
+ Browser:              **chromium**
+ Notification system:  **dunst**
+ Image viewer:         **feh**
+ PDF viewer:           **zathura**
+ Compositor:           **compton**
+ Video player:         **mpv**
+ Music player:         **spotify**
+ Torrent client:       **transmission**
+ Mail client:          **mutt**

Builds of suckless tools are in [this repo](https://github.com/mjturt/suckless).

![Screenshot](screenshots/screenshot.png?raw=true)

Colors: [Sourcerer](https://github.com/xero/sourcerer).

Fonts: Plex, Gohu, OhSnap. Patched versions with icons from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

ZSH prompt: [distroprompt-zsh](https://github.com/mjturt/distroprompt-zsh).

### Linux console

Proper kernel and driver support with properly generated initramfs needed to get 1920x1080 resolution support in console(without X11/Wayland). Fbterm (framebuffer terminal emulator) is used to get background image and true type font support. [Startup scrip](scripts/sh/fb).

[Console screenshot](screenshots/console.png?raw=true)

### Scripts

Collection of scripts can be found in [scripts directory](scripts). If I did not write a script, it should be mentioned.

### install.sh

install.sh script is designed for personal use and even though it makes always backups it is not recommended to use. Help:
```
./install.sh --help
```
