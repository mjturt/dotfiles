# mjturt's dotfiles

This repository is attempt to bring my dotfiles under version controlling. Mainly for my Gentoo Linux main machine but contains some host-specific configurations for my Archlinux laptop and Debian server in their own directories. For most part these dotfiles are distro-independent but I just want to have host-specific options.

### Software

+ Text editor:          **ViM**
+ Window manager:       **i3**
+ Terminal emulator:    **urxvt**
+ Shell:                **ZSH**
+ Terminal multiplexer: **Tmux**
+ File manager:         **Ranger**
+ Launcher:             **Rofi**
+ Browser:              **Vimb**
+ Notification system:  **Dunst**
+ Image viewer:         **Feh**
+ PDF viewer:           **Zathura**
+ Compositor:           **Compton**
+ VCS:                  **GIT**
+ Video player:         **mpv**
+ Music player:         **cmus**

There also config files for GNU less, GNU screen, xbindkeys, xinit, GTK, w3m

### Keybindings

All programs that use Vim-keybindings I have remapped keys HJKL -> JKLÖ (Ö is finnish letter, in same place on US-layout is odiaeresis). That way I can use Vim navigation keys without moving fingers from standard touch typing position. I find this more natural to me.

### Appearance
![Screenshot](screenshots/screenshot.png?raw=true)

I use [Dracula colorscheme](https://github.com/dracula/dracula-theme) everywhere on my main machine. I have been ported it to many programs that I use but are not supported.
Font that I use is ShureTechMono and patched version with icons can be found from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

### Scripts

Collection of scripts can be found in [scripts directory](scripts). Status scripts are used with statuslines, conky, etc. Scripts that works only with specific program are in their own directories and universal in statusscripts-root. If I did not write a script, it should be mentioned.

### install.sh

install.sh script can be used to install all the dotfiles, group of them, or just single programs dotfiles. Although it makes backups I do not recommend using it for anything other that just single programs. It is intended for my own use only. For options available:
```
./install.sh --help
```
