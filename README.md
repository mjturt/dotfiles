# mjturt's dotfiles

This repository is attempt to bring my dotfiles under version controlling. Mainly for my Gentoo Linux main machine but contains some host-specific configurations for my Gentoo laptop and Debian server in their own directories.

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

There also config files for GNU less, GNU screen, xbindkeys, xinit, GTK, w3m, GIT, GPG, fbterm, vimb, offlineimap, teiler, sxhkd, i3, i3blocks, herbstluftwm and for pass and buku rofi-frontends.

### Keybindings

All programs that use Vim-keybindings I have remapped keys HJKL -> JKLÖ (Ö is finnish letter, in same place on US-layout is odiaeresis). That way I can use Vim navigation keys without moving fingers from standard touch typing position. I find this more natural to me.

### Appearance
![Screenshot](screenshots/screenshot.png?raw=true)

Only 1 of 2 monitors.

Colorscheme: [Sourcerer](https://github.com/xero/sourcerer).

All fonts used: envypn, OhSnap, Hurmit, Gohu, ShureTechMono. Patched versions of non-bitmap fonts with icons can be found from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

ZSH prompt theme is [distroprompt-zsh](https://github.com/mjturt/distroprompt-zsh).

#### Without X11 (just a Linux console):
![Console screenshot](screenshots/console.png?raw=true)

Proper kernel and driver support with properly generated initramfs needed to get 1920x1080 resolution support in console. Fbterm (framebuffer terminal emulator) is used to get background image and true type font support. [Startup scrip](scripts/bin/fb).

Colorscheme: [Dracula](https://github.com/dracula/dracula-theme)

Other programs used in screenshot: tmux for "window managment", w3m for web browsing with image support, glances, vim, ranger, weechat, cmus and alsamixer.


### Scripts

Collection of scripts can be found in [scripts directory](scripts). Status scripts are used with system status widgets, statuslines, panels, etc. Scripts that works only with specific program are in their own directories and universal in statusscripts root. If I did not write a script, it should be mentioned.

### install.sh

install.sh script can be used to install all the dotfiles, group of them, or just single programs dotfiles. Although it makes backups I do not recommend using it. It is intended for my own use. Still, for options available:
```
./install.sh --help
```
