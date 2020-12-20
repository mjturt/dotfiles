# dotfiles

This repository is attempt to bring my dotfiles under version controlling. Operating systems in use are Arch Linux and FreeBSD.

### Software

+ Text editor:          **neovim**
+ Window manager:       **i3**
+ Panel:                **polybar**
+ Terminal emulator:    **alacritty**
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


![Screenshot](screenshots/screenshot.png?raw=true)

Font: Hack. Patched version with icons from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

ZSH prompt: [distroprompt-zsh](https://github.com/mjturt/distroprompt-zsh).

### Linux console

Proper kernel and driver support with properly generated initramfs needed to get 1920x1080 resolution support in console(without X11/Wayland). Fbterm is used to get background image and true type font support. [Screenshot](screenshots/console.png?raw=true).

### Other

Collection of scripts can be found in [scripts repository](https://github.com/mjturt/scripts).

Builds of suckless tools are in [this repo](https://github.com/mjturt/suckless).

### install.sh

`install.sh` script is designed for personal use and even though it always makes backups it's not recommended to use. Help:
```
./install.sh --help
```
