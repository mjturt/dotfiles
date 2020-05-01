#!/usr/bin/env bash
#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀░┃
#┃░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█░┃
#┃░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░┃
#┠━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
#┃░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░┃
#┃░░ Install script for mjturt's ░░┃
#┃░░ dotfiles.                   ░░┃
#┃░░ Do not recommended to use.  ░░┃
#┃░░ Basic setup:                ░░┃
#┃░░ ./install.sh commons        ░░┃
#┃░░ ./install.sh host_r5        ░░┃
#┃░░ ./install.sh -h to get help ░░┃
#┃░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃ Annoying starting animation ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

animate() {
    echo -ne "     $1\\033[0K\\r"
    sleep "$2"
}

echo
echo -e "       \\e[1;35m▛▀\\e[1;31m▖▞\\e[1;33m▀▖\\e[1;32m▀▛\\e[1;36m▘▛\\e[0;34m▀▘\\e[0;35m▜▘\\e[0;31m▌ \\e[0;33m ▛\\e[0;32m▀▘\\e[0;36m▞▀"
echo -e "       \\e[1;31m▌ \\e[0;34m▌▌ \\e[0;32m▌ \\e[0;36m▌\\e[0;34m ▙\\e[0;35m▄ \\e[0;31m▐ \\e[0;33m▌ \\e[0;32m ▙\\e[0;36m▄ \\e[0;34m▚▄"
echo -e "       \\e[1;33m▌ \\e[0;32m▌▌ \\e[0;36m▌ \\e[0;34m▌\\e[0;35m ▌  \\e[0;33m▐ \\e[0;32m▌ \\e[0;36m ▌ \\e[0;35m ▖ \\e[0;31m▌"
echo -e "       \\e[1;32m▀▀ \\e[0;34m▝▀  \\e[0;35m▘\\e[0;31m ▘ \\e[0;32m ▀▘\\e[0;36m▀▀\\e[0;34m▘▀\\e[0;35m▀▘\\e[0;31m▝▀"
sleep 0.1
echo -e "\\e[1;30m     ──────────────────────────"
animate "\\e[1;34mＩ\\e[0m" 0.1
animate "\\e[1;34mＩＮ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[1;35mＳ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[1;35mＳＣ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[1;35mＳＣＲ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[1;35mＳＣＲＩ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[1;35mＳＣＲＩＰ\\e[0m" 0.1
animate "\\e[1;34mＩＮＳＴＡＬＬ\\e[1;35mＳＣＲＩＰＴ\\e[0m" 0.1
echo
echo

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃ Variables and testing function ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

BACKUPROOT=~/.dotfiles-backup
BACKUP=${BACKUPROOT}/dotfiles-backup-$(date +%H%M%S)
LOGS=${BACKUP}/dotfiles-logs-$(date +%H%M%S).log
DOT=$(pwd)
isFunction() { [[ "$(declare -Ff "$1")" ]]; }

#┏━━━━━━━━┓
#┃ Groups ┃
#┗━━━━━━━━┛

# Installing common files
commons() {
    commons_cli
    commons_x11
}

# Commons, but only command line programs
commons_cli() {
    df_vim
    df_tmux
    df_zsh
    df_ranger
    df_screen
    df_less
    df_w3m
    df_gpg
    df_calcurse
    df_newsboat
    df_linopen
    df_elinks
    df_spacevim
    df_neovim
    df_mutt
    df_tmuxp
    df_abook
    df_transmission
    df_tremc
    df_lf
    df_npm
}

# Commons, but only graphical programs
commons_x11() {
    df_xresources
    df_rofi
    df_feh
    df_zathura
    df_picom
    df_vimb
    df_i3
    df_mpv
    df_cmus
    df_qutebrowser
    df_rofipass
    df_buku_run
    df_dunst
    df_teiler
    df_sxhkd
    df_hlwm
    df_bspwm
    df_termite
    df_twmn
    df_logiops
}

# Only host-specific files (R5)
host_r5() {
    df_zprofile r5
    df_ranger r5
    df_xinit r5
    df_xbindkeys r5
    df_gtk3 r5
    df_gtk2 r5
    df_buku
    df_polybar
}

# Only host-specific files (server)
host_server() {
    df_zprofile server
    df_ranger server
    df_rtorrent
    df_irssi
    df_vdirsyncer
    df_khard
}

# Only host-specific files (Thinkpad)
host_thinkpad() {
    df_zprofile thinkpad
    df_ranger thinkpad
    df_xinit thinkpad
    df_xbindkeys thinkpad
    df_gtk3 thinkpad
    df_gtk2 thinkpad
    df_xmodmap thinkpad
    df_buku
    df_polybar
}

# Private assets
assets() {
    df_fonts
    df_cursors
    df_gtk_themes
    df_fbcolors
}

#┏━━━━━━━━━━┓
#┃ Programs ┃
#┗━━━━━━━━━━┛

# ViM (commons)
df_vim() {
    if [[ -e ~/.vim ]]; then
        mv -v ~/.vim "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.vim ]]; then
        rm -v ~/.vim >> "$LOGS"
    fi
    if [[ -e ~/.vimrc ]]; then
        mv -v ~/.vimrc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.vimrc ]]; then
        rm -v ~/.vimrc >> "$LOGS"
    fi
    if [[ -e ~/.gvimrc ]]; then
        mv -v ~/.gvimrc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.gvimrc ]]; then
        rm -v ~/.gvimrc >> "$LOGS"
    fi
    {
        mkdir -v ~/.vim
        mkdir -v ~/.vim/temp
        mkdir -v ~/.vim/temp/backup
        mkdir -v ~/.vim/temp/swap
        mkdir -v ~/.vim/temp/undo
        ln -v -s "${DOT}"/.vimrc ~/.vimrc
        ln -v -s "${DOT}"/.vim/indent ~/.vim/indent
        ln -v -s "${DOT}"/.vim/projects.vim ~/.vim/projects.vim
        ln -v -s "${DOT}"/.vim/filetype.vim ~/.vim/filetype.vim
        ln -v -s "${DOT}"/.gvimrc ~/.gvimrc
    } >> "$LOGS"
}

# Tmux (commons)
df_tmux() {
    if [[ -e ~/.tmux.conf ]]; then
        mv -v ~/.tmux.conf "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.tmux.conf ]]; then
        rm -v ~/.tmux.conf >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.tmux.conf ~/.tmux.conf >> "$LOGS"
}

# ZSH (commons)
df_zsh() {
    if [[ -e ~/.zsh ]]; then
        mv -v ~/.zsh "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.zsh ]]; then
        rm -v ~/.zsh >> "$LOGS"
    fi
    if [[ -e ~/.zshrc ]]; then
        mv -v ~/.zshrc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.zshrc ]]; then
        rm -v ~/.zshrc >> "$LOGS"
    fi
    if [[ -e ~/.zshenv ]]; then
        mv -v ~/.zshenv "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.zshenv ]]; then
        rm -v ~/.zshenv >> "$LOGS"
    fi
    {
        mkdir -v ~/.zsh
        ln -v -s "${DOT}"/.zsh/site-functions ~/.zsh/site-functions
        ln -v -s "${DOT}"/.zsh/themes ~/.zsh/themes
        ln -v -s "${DOT}"/.zsh/aliases.zsh ~/.zsh/aliases.zsh
        ln -v -s "${DOT}"/.zsh/evars.zsh ~/.zsh/evars.zsh
        ln -v -s "${DOT}"/.zsh/functions.zsh ~/.zsh/functions.zsh
        ln -v -s "${DOT}"/.zsh/keybindings.zsh ~/.zsh/keybindings.zsh
        ln -v -s "${DOT}"/.zsh/dircolors ~/.zsh/dircolors
        ln -v -s "${DOT}"/.zsh/private.zsh ~/.zsh/private.zsh
        ln -v -s "${DOT}"/.zshrc ~/.zshrc
        ln -v -s "${DOT}"/.zsh/plugins ~/.zsh/plugins
        ln -v -s "${DOT}"/.zshenv ~/.zshenv
    } >> "$LOGS"
}

# zprofile (r5, server, thinkpad)
df_zprofile() {
    if [[ -e ~/.zprofile ]]; then
        mv -v ~/.zprofile "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.zprofile ]]; then
        rm -v ~/.zprofile >> "$LOGS"
    fi
    if [[ "$1" == "r5" ]] || [[ "$1" == "thinkpad" ]]; then
        if [[ $(id -u) -eq 0 ]]; then
            ln -v -s "${DOT}"/.zprofile-root ~/.zprofile >> "$LOGS"
        else
            ln -v -s "${DOT}"/.zprofile ~/.zprofile >> "$LOGS"
        fi
    elif [[ "$1" == "server" ]]; then
        ln -v -s "${DOT}"/server/.zprofile ~/.zprofile >> "$LOGS"
    fi
}

# Ranger (commons, r5, server, thinkpad)
df_ranger() {
    if [[ -z "$1" ]]; then
        if [[ -e ~/.config/ranger ]]; then
            mv -v ~/.config/ranger "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/ranger ]]; then
            rm -v ~/.config/ranger >> "$LOGS"
        fi
        {
            mkdir -p -v ~/.config/ranger
            mkdir -p -v ~/.config/ranger/colorschemes
            mkdir -p -v ~/.config/ranger/plugins
            ln -v -s "${DOT}"/.config/ranger/rc.conf ~/.config/ranger/rc.conf
            ln -v -s "${DOT}"/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf
            ln -v -s "${DOT}"/.config/ranger/scope.sh ~/.config/ranger/scope.sh
            chmod -v +x ~/.config/ranger/scope.sh
            ln -v -s "${DOT}"/.config/ranger/commands.py ~/.config/ranger/commands.py
            ln -v -s "${DOT}"/.config/ranger/devicons.py ~/.config/ranger/devicons.py
            ln -v -s "${DOT}"/.config/ranger/colorschemes/*.py ~/.config/ranger/colorschemes
            ln -v -s "${DOT}"/.config/ranger/plugins/*.py ~/.config/ranger/plugins
        } >> "$LOGS"
    elif [[ $1 == "r5" ]]; then
        if [[ -e ~/.config/ranger/bookmarks ]]; then
            mv -v ~/.config/ranger/bookmarks "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/ranger/bookmarks ]]; then
            rm -v ~/.config/ranger/bookmarks >> "$LOGS"
        fi
        ln -v -s "${DOT}"/.config/ranger/bookmarks ~/.config/ranger/bookmarks >> "$LOGS"
    elif [[ $1 == "server" ]]; then
        if [[ -e ~/.config/ranger/bookmarks ]]; then
            mv -v ~/.config/ranger/bookmarks "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/ranger/bookmarks ]]; then
            rm -v ~/.config/ranger/bookmarks >> "$LOGS"
        fi
        ln -v -s "${DOT}"/server/.config/ranger/bookmarks ~/.config/ranger/bookmarks >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.config/ranger/bookmarks ]]; then
            mv -v ~/.config/ranger/bookmarks "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/ranger/bookmarks ]]; then
            rm -v ~/.config/ranger/bookmarks >> "$LOGS"
        fi
        ln -v -s "${DOT}"/thinkpad/.config/ranger/bookmarks ~/.config/ranger/bookmarks >> "$LOGS"
    fi

}

# GNU Screen (commons)
df_screen() {
    if [[ -e ~/.screenrc ]]; then
        mv -v ~/.screenrc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.screenrc ]]; then
        rm -v ~/.screenrc >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.screenrc ~/.screenrc >> "$LOGS"
}

# GNU Less (commons)
df_less() {
    if [[ -e ~/.lesskey ]]; then
        mv -v ~/.lesskey "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.lesskey ]]; then
        rm -v ~/.lesskey >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.lesskey ~/.lesskey >> "$LOGS"
    lesskey ~/.lesskey
}

# Xresources (commons)
df_xresources() {
    if [[ -e ~/.Xresources.d ]]; then
        mv -v ~/.Xresources.d "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.Xresources.d ]]; then
        rm -v ~/.Xresources.d >> "$LOGS"
    fi
    if [[ -e ~/.Xresources ]]; then
        mv -v ~/.Xresources "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.Xresources ]]; then
        rm -v ~/.Xresources >> "$LOGS"
    fi
    {
        mkdir -v ~/.Xresources.d
        ln -v -s "${DOT}"/.Xresources ~/.Xresources
        ln -v -s "${DOT}"/.Xresources.d/colors ~/.Xresources.d/colors
        ln -v -s "${DOT}"/.Xresources.d/perl ~/.Xresources.d/perl
    } >> "$LOGS"
    xrdb ~/.Xresources
}

# Rofi (commons)
df_rofi() {
    if [[ -e ~/.config/rofi ]]; then
        mv -v ~/.config/rofi "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/rofi ]]; then
        rm -v ~/.config/rofi >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/rofi
        ln -v -s "${DOT}"/.config/rofi/themes ~/.config/rofi/themes
        ln -v -s "${DOT}"/.config/rofi/scripts ~/.config/rofi/scripts
        ln -v -s "${DOT}"/.config/rofi/config ~/.config/rofi/config
        ln -v -s "${DOT}"/.config/rofi/scripts/rofi-notes.sh "${DOT}"/scripts/bin/rofi-notes
        ln -v -s "${DOT}"/.config/rofi/scripts/rofi-power.sh "${DOT}"/scripts/bin/rofi-power
    } >> "$LOGS"
}

# Feh (commons)
df_feh() {
    if [[ -e ~/.config/feh ]]; then
        mv -v ~/.config/feh "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/feh ]]; then
        rm -v ~/.config/feh >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.config/feh ~/.config/feh >> "$LOGS"
}

# Zathura (commons)
df_zathura() {
    if [[ -e ~/.config/zathura ]]; then
        mv -v ~/.config/zathura "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/zathura ]]; then
        rm -v ~/.config/zathura >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.config/zathura ~/.config/zathura >> "$LOGS"
}

# Picom (commons)
df_picom() {
    if [[ -e ~/.config/picom.conf ]]; then
        mv -v ~/.config/picom.conf "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/picom.conf ]]; then
        rm -v ~/.config/picom.conf >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.config/picom.conf ~/.config/picom.conf >> "$LOGS"
}

# Vimb (commons)
df_vimb() {
    if [[ -e ~/.config/vimb ]]; then
        mv -v ~/.config/vimb "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/vimb ]]; then
        rm -v ~/.config/vimb >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/vimb
        ln -v -s "${DOT}"/.config/vimb/config ~/.config/vimb/config
        ln -v -s "${DOT}"/.config/vimb/style.css ~/.config/vimb/style.css
    } >> "$LOGS"
}

# Git (commons)
df_git() {
    if [[ -e ~/.gitconfig ]]; then
        mv -v ~/.gitconfig "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.gitconfig ]]; then
        rm -v ~/.gitconfig >> "$LOGS"
    fi
    if [[ -e ~/.gitignore_global ]]; then
        mv -v ~/.gitignore_global "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.gitignore_global ]]; then
        rm -v ~/.gitignore_global >> "$LOGS"
    fi
    ln -v -s "${DOT}"/.gitconfig ~/.gitconfig >> "$LOGS"
    ln -v -s "${DOT}"/.gitignore_global ~/.gitignore_global >> "$LOGS"
}

# i3 (commons, r5, thinkpad)
df_i3() {
    if [[ -z "$1" ]]; then
        if [[ -e ~/.config/i3 ]]; then
            mv -v ~/.config/i3 "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/i3 ]]; then
            rm -v ~/.config/i3 >> "$LOGS"
        fi
        mkdir -v ~/.config/i3 >> "$LOGS"
        ln -v -s "${DOT}"/.config/i3/themes ~/.config/i3/themes >> "$LOGS"
    elif [[ $1 == "r5" ]]; then
        if [[ -e ~/.config/i3/config ]]; then
            mv -v ~/.config/i3/config "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/i3/config ]]; then
            rm -v ~/.config/i3/config >> "$LOGS"
        fi
        cat "${DOT}"/.config/i3/config.base "${DOT}"/.config/i3/config.r5 > ~/.config/i3/config
        "${DOT}"/scripts/sh/i3c >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.config/i3/config ]]; then
            mv -v ~/.config/i3/config "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/i3/config ]]; then
            rm -v ~/.config/i3/config >> "$LOGS"
        fi
        cat "${DOT}"/.config/i3/config.base "${DOT}"/.config/i3/config.thinkpad > ~/.config/i3/config
        "${DOT}"/scripts/sh/i3c >> "$LOGS"
    fi
}

# i3blocks (r5, thinkpad)
df_i3blocks() {
    if [[ $1 == "r5" ]]; then
        if [[ -e ~/.i3blocks.conf ]]; then
            mv -v ~/.i3blocks.conf "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.i3blocks.conf ]]; then
            rm -v ~/.i3blocks.conf >> "$LOGS"
        fi
        ln -v -s "${DOT}"/.i3blocks.conf ~/.i3blocks.conf >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.i3blocks.conf ]]; then
            mv -v ~/.i3blocks.conf "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.i3blocks.conf ]]; then
            rm -v ~/.i3blocks.conf >> "$LOGS"
        fi
        ln -v -s "${DOT}"/thinkpad/.i3blocks.conf ~/.i3blocks.conf >> "$LOGS"
    fi
}

# Dunst (commons)
df_dunst() {
    if [[ -e ~/.config/dunst ]]; then
        mv -v ~/.config/dunst "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/dunst ]]; then
        rm -v ~/.config/dunst >> "$LOGS"
    fi
    mkdir -v ~/.config/dunst >> "$LOGS"
    ln -v -s "${DOT}"/.config/dunst/dunstrc ~/.config/dunst/dunstrc >> "$LOGS"
}

# Xinit (r5, thinkpad)
df_xinit() {
    if [[ $1 == "r5" ]]; then
        if [[ -e ~/.xinitrc ]]; then
            mv -v ~/.xinitrc "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.xinitrc ]]; then
            rm -v ~/.xinitrc >> "$LOGS"
        fi
        ln -v -s "${DOT}"/.xinitrc ~/.xinitrc >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.xinitrc ]]; then
            mv -v ~/.xinitrc "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.xinitrc ]]; then
            rm -v ~/.xinitrc >> "$LOGS"
        fi
        ln -v -s "${DOT}"/thinkpad/.xinitrc ~/.xinitrc >> "$LOGS"
    fi
}

# Xbindkeys (r5, thinkpad)
df_xbindkeys() {
    if [[ $1 == "r5" ]]; then
        if [[ -e ~/.xbindkeysrc ]]; then
            mv -v ~/.xbindkeysrc "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.xbindkeysrc ]]; then
            rm -v ~/.xbindkeysrc >> "$LOGS"
        fi
        ln -v -s "${DOT}"/.xbindkeysrc ~/.xbindkeysrc >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.xbindkeysrc ]]; then
            mv -v ~/.xbindkeysrc "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.xbindkeysrc ]]; then
            rm -v ~/.xbindkeysrc >> "$LOGS"
        fi
        ln -v -s "${DOT}"/thinkpad/.xbindkeysrc ~/.xbindkeysrc >> "$LOGS"
    fi
}

# GTK 3.0 (r5, thinkpad)
df_gtk3() {
    if [[ $1 == "r5" ]]; then
        if [[ -e ~/.config/gtk-3.0 ]]; then
            mv -v ~/.config/gtk-3.0 "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/gtk-3.0 ]]; then
            rm -v ~/.config/gtk-3.0 >> "$LOGS"
        fi
        mkdir -v ~/.config/gtk-3.0 >> "$LOGS"
        ln -v -s "${DOT}"/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.config/gtk-3.0 ]]; then
            mv -v ~/.config/gtk-3.0 "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.config/gtk-3.0 ]]; then
            rm -v ~/.config/gtk-3.0 >> "$LOGS"
        fi
        mkdir -v ~/.config/gtk-3.0 >> "$LOGS"
        ln -v -s "${DOT}"/thinkpad/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini >> "$LOGS"
    fi
}

# GTK 2.0 (r5, thinkpad)
df_gtk2() {
    if [[ $1 == "r5" ]]; then
        if [[ -e ~/.gtkrc-2.0 ]]; then
            mv -v ~/.gtkrc-2.0 "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.gtkrc-2.0 ]]; then
            rm -v ~/.gtkrc-2.0 >> "$LOGS"
        fi
        ln -v -s "${DOT}"/.gtkrc-2.0 ~/.gtkrc-2.0 >> "$LOGS"
    elif [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.gtkrc-2.0 ]]; then
            mv -v ~/.gtkrc-2.0 "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.gtkrc-2.0 ]]; then
            rm -v ~/.gtkrc-2.0 >> "$LOGS"
        fi
        ln -v -s "${DOT}"/thinkpad/.gtkrc-2.0 ~/.gtkrc-2.0 >> "$LOGS"
    fi
}

# Xmodmap (thinkpad)
df_xmodmap() {
    if [[ $1 == "thinkpad" ]]; then
        if [[ -e ~/.Xmodmap ]]; then
            mv -v ~/.Xmodmap "$BACKUP" >> "$LOGS"
        elif [[ -L ~/.Xmodmap ]]; then
            rm -v ~/.Xmodmap >> "$LOGS"
        fi
        ln -v -s "${DOT}"/thinkpad/.Xmodmap ~/.Xmodmap >> "$LOGS"
    fi
}

# Cmus (commons)
df_cmus() {
    if [[ -e ~/.config/cmus ]]; then
        mv -v ~/.config/cmus "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/cmus ]]; then
        rm -v ~/.config/cmus >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/cmus
        ln -s -v "${DOT}"/.config/cmus/rc ~/.config/cmus/rc
        ln -s -v "${DOT}"/.config/cmus/scripts ~/.config/cmus/scripts
    } >> "$LOGS"
}

# MPV (commons)
df_mpv() {
    if [[ -e ~/.config/mpv ]]; then
        mv -v ~/.config/mpv "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/mpv ]]; then
        rm -v ~/.config/mpv >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/mpv
        ln -s -v "${DOT}"/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf
        ln -s -v "${DOT}"/.config/mpv/input.conf ~/.config/mpv/input.conf
    } >> "$LOGS"
}

# rtorrent (commons)
df_rtorrent() {
    if [[ -e ~/.rtorrent.rc ]]; then
        mv -v ~/.rtorrent.rc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.rtorrent.rc ]]; then
        rm -v ~/.rtorrent.rc >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.rtorrent.rc ~/.rtorrent.rc >> "$LOGS"
}

# w3m (commons)
df_w3m() {
    if [[ -e ~/.w3m ]]; then
        mv -v ~/.w3m "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.w3m ]]; then
        rm -v ~/.w3m >> "$LOGS"
    fi
    mkdir -v ~/.w3m >> "$LOGS"
    ln -s -v "${DOT}"/.w3m/keymap ~/.w3m/keymap >> "$LOGS"
}

# qutebrowser (commons)
df_qutebrowser() {
    if [[ -e ~/.config/qutebrowser ]]; then
        mv -v ~/.config/qutebrowser "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/qutebrowser ]]; then
        rm -v ~/.config/qutebrowser >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/qutebrowser
        ln -s -v "${DOT}"/.config/qutebrowser/config.py ~/.config/qutebrowser/config.py
        ln -s -v "${DOT}"/.config/qutebrowser/bookmarks ~/.config/qutebrowser/bookmarks
        ln -s -v "${DOT}"/.config/qutebrowser/quickmarks ~/.config/qutebrowser/quickmarks
        ln -s -v "${DOT}"/.config/qutebrowser/themes ~/.config/qutebrowser/themes
        ln -s -v "${DOT}"/.config/qutebrowser/userscripts ~/.config/qutebrowser/userscripts
        ln -s -v "${DOT}"/.config/qutebrowser/stylesheets ~/.config/qutebrowser/stylesheets
    } >> "$LOGS"
}

# GPG (commons)
# This is little bit different because the nature of GPG
df_gpg() {
    if [[ ! -d ~/.gnupg ]]; then
        mkdir -v ~/.gnupg >> "$LOGS"
    fi
    if [[ -e ~/.gnupg/gpg.conf ]]; then
        mv -v ~/.gnupg/gpg.conf "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.gnupg/gpg.conf ]]; then
        rm -v ~/.gnupg/gpg.conf >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.gnupg/gpg.conf ~/.gnupg/gpg.conf >> "$LOGS"
}

# Irssi (private, commons)
df_irssi() {
    if [[ -e ~/.irssi ]]; then
        mv -v ~/.irssi "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.irssi ]]; then
        rm -v ~/.irssi >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.irssi ~/.irssi >> "$LOGS"
}

# Buku (private, commons)
df_buku() {
    if [[ -e ~/.local/share/buku/bookmarks.db ]]; then
        mv -v ~/.local/share/buku/bookmarks.db "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.local/share/buku/bookmarks.db ]]; then
        rm -v ~/.local/share/buku/bookmarks.db >> "$LOGS"
    fi
    mkdir -v -p ~/.local/share/buku >> "$LOGS"
    ln -s -v "${DOT}"/bookmarks.db ~/.local/share/buku/bookmarks.db >> "$LOGS"
}

# Rofi-pass (commons)
df_rofipass() {
    if [[ -e ~/.config/rofi-pass ]]; then
        mv -v ~/.config/rofi-pass "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/rofi-pass ]]; then
        rm -v ~/.config/rofi-pass >> "$LOGS"
    fi
    mkdir -v ~/.config/rofi-pass >> "$LOGS"
    ln -s -v "${DOT}"/.config/rofi-pass/config ~/.config/rofi-pass/config >> "$LOGS"
}

# buku_run (commons)
df_buku_run() {
    if [[ -e ~/.config/buku_run ]]; then
        mv -v ~/.config/buku_run "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/buku_run ]]; then
        rm -v ~/.config/buku_run >> "$LOGS"
    fi
    mkdir -v ~/.config/buku_run >> "$LOGS"
    ln -s -v "${DOT}"/.config/buku_run/config ~/.config/buku_run/config >> "$LOGS"
}

# Mutt (commons)
df_mutt() {
    if [[ -e ~/.mutt ]]; then
        mv -v ~/.mutt "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.mutt ]]; then
        rm -v ~/.mutt >> "$LOGS"
    fi
    if [[ -e ~/.offlineimaprc ]]; then
        mv -v ~/.offlineimaprc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.offlineimaprc ]]; then
        rm -v ~/.offlineimaprc >> "$LOGS"
    fi
    if [[ -e ~/.offlineimap.py ]]; then
        mv -v ~/.offlineimap.py "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.offlineimap.py ]]; then
        rm -v ~/.offlineimap.py >> "$LOGS"
    fi
    if [[ -e ~/.notmuch-config ]]; then
        mv -v ~/.notmuch-config "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.notmuch-config ]]; then
        rm -v ~/.notmuch-config >> "$LOGS"
    fi
    if [[ -e ~/.mbsyncrc ]]; then
        mv -v ~/.mbsyncrc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.mbsyncrc ]]; then
        rm -v ~/.mbsyncrc >> "$LOGS"
    fi
    if [[ -e ~/.config/msmtp ]]; then
        mv -v ~/.config/msmtp "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/msmtp ]]; then
        rm -v ~/.config/msmtp >> "$LOGS"
    fi
    {
        mkdir -v ~/.mutt
        ln -s -v "${DOT}"/.mutt/keybindings ~/.mutt/keybindings
        ln -s -v "${DOT}"/.mutt/mailcap ~/.mutt/mailcap
        ln -s -v "${DOT}"/.mutt/colors ~/.mutt/colors
        ln -s -v "${DOT}"/.mutt/scripts ~/.mutt/scripts
        ln -s -v "${DOT}"/.mutt/aliases ~/.mutt/aliases
        ln -s -v "${DOT}"/.mutt/gpg.rc ~/.mutt/gpg.rc
        ln -s -v "${DOT}"/.mutt/notmuch-config ~/.notmuch-config
    } >> "$LOGS"
    if [[ $(id -u) -eq 0 ]]; then
        ln -s -v "${DOT}"/.mutt/muttrc-local ~/.mutt/muttrc >> "$LOGS"
    else
        if [[ ! -e ~/.local/share/mail ]]; then
            mkdir -v -p ~/.local/share/mail/{utu,gmail,lvs} >> "$LOGS"
        fi
        {
            mkdir -v -p ~/.mutt/cache/{utu,gmail,lvs}/{headers,messages}
            ln -s -v "${DOT}"/.mutt/muttrc ~/.mutt/muttrc
            ln -s -v "${DOT}"/.mutt/muttrc-local ~/.mutt/muttrc-local
            ln -s -v "${DOT}"/.mutt/mailboxes ~/.mutt/mailboxes
            ln -s -v "${DOT}"/.mutt/accounts ~/.mutt/accounts
            ln -s -v "${DOT}"/.mutt/signatures ~/.mutt/signatures
            ln -s -v "${DOT}"/.mutt/lists ~/.mutt/lists
            ln -s -v "${DOT}"/.mutt/offlineimap/offlineimaprc ~/.offlineimaprc
            ln -s -v "${DOT}"/.mutt/offlineimap/offlineimap.py ~/.offlineimap.py
            ln -s -v "${DOT}"/.mbsyncrc ~/.mbsyncrc
            ln -s -v "${DOT}"/.config/msmtp ~/.config/msmtp
        } >> "$LOGS"
    fi
}

# Polybar (commons)
df_polybar() {
    if [[ -e ~/.config/polybar ]]; then
        mv -v ~/.config/polybar "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/polybar ]]; then
        rm -v ~/.config/polybar >> "$LOGS"
    fi
    mkdir -v ~/.config/polybar >> "$LOGS"
    ln -s -v "${DOT}"/.config/polybar/config* ~/.config/polybar >> "$LOGS"
}

# Herbstluftwm (commons)
df_hlwm() {
    if [[ -e ~/.config/herbstluftwm ]]; then
        mv -v ~/.config/herbstluftwm "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/herbstluftwm ]]; then
        rm -v ~/.config/herbstluftwm >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/herbstluftwm
        ln -s -v "${DOT}"/.config/herbstluftwm/autostart ~/.config/herbstluftwm/autostart
        ln -s -v "${DOT}"/.config/herbstluftwm/scripts ~/.config/herbstluftwm/scripts
    } >> "$LOGS"
}

# Teiler (commons)
df_teiler() {
    if [[ -e ~/.config/teiler ]]; then
        mv -v ~/.config/teiler "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/teiler ]]; then
        rm -v ~/.config/teiler >> "$LOGS"
    fi
    mkdir -v ~/.config/teiler >> "$LOGS"
    ln -s -v "${DOT}"/.config/teiler/config ~/.config/teiler/config >> "$LOGS"
}

# BSPWM (commons)
df_bspwm() {
    if [[ -e ~/.config/bspwm ]]; then
        mv -v ~/.config/bspwm "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/bspwm ]]; then
        rm -v ~/.config/bspwm >> "$LOGS"
    fi
    mkdir -v ~/.config/bspwm >> "$LOGS"
    ln -s -v "${DOT}"/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc >> "$LOGS"
}

# sxhkd (commons)
df_sxhkd() {
    if [[ -e ~/.config/sxhkd ]]; then
        mv -v ~/.config/sxhkd "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/sxhkd ]]; then
        rm -v ~/.config/sxhkd >> "$LOGS"
    fi
    mkdir -v ~/.config/sxhkd >> "$LOGS"
    ln -s -v "${DOT}"/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc >> "$LOGS"
}

# Fonts (private, commons)
# Global install!
df_fonts() {
    if [[ -e /usr/share/fonts/fontset ]]; then
        sudo mv -v /usr/share/fonts/fontset "$BACKUP" >> "$LOGS"
    elif [[ -L /usr/share/fonts/fontset ]]; then
        sudo rm -v /usr/share/fonts/fontset >> "$LOGS"
    fi
    sudo ln -s -v "${DOT}"/assets/fontset /usr/share/fonts/fontset >> "$LOGS"
}

# Cursors (private, commons)
# Global install! Copy!
df_cursors() {
    if [[ -e /usr/share/cursors/xorg-x11 ]]; then
        sudo mv -v /usr/share/cursors/xorg-x11 "$BACKUP" >> "$LOGS"
    elif [[ -L /usr/share/cursors/xorg-x11 ]]; then
        sudo rm -v /usr/share/cursors/xorg-x11 >> "$LOGS"
    fi
    sudo mkdir -v -p /usr/share/cursors/xorg-x11 >> "$LOGS"
    sudo cp -R -v "${DOT}"/assets/cursors/* /usr/share/cursors/xorg-x11 >> "$LOGS"
}

# GTK themes (private, commons)
# Copy!
df_gtk_themes() {
    if [[ -e ~/.themes ]]; then
        mv -v ~/.themes "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.themes ]]; then
        rm -v ~/.themes >> "$LOGS"
    fi
    mkdir -v -p ~/.themes >> "$LOGS"
    cp -R -v "${DOT}"/assets/gtk-themes/* ~/.themes >> "$LOGS"
}

# Console framebuffer colors (private, commons)
df_fbcolors() {
    if [[ -e ~/.fbcolors ]]; then
        mv -v ~/.fbcolors "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.fbcolors ]]; then
        rm -v ~/.fbcolors >> "$LOGS"
    fi
    ln -s -v "${DOT}"/assets/fbcolors ~/.fbcolors >> "$LOGS"
}

# Elinks (commons)
df_elinks() {
    if [[ -e ~/.elinks ]]; then
        mv -v ~/.elinks "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.elinks ]]; then
        rm -v ~/.elinks >> "$LOGS"
    fi
    mkdir -v ~/.elinks >> "$LOGS"
    ln -s -v "${DOT}"/.elinks/elinks.conf ~/.elinks/elinks.conf >> "$LOGS"
}

# Calcurse (commons, private)
df_calcurse() {
    if [[ -e ~/.calcurse ]]; then
        mv -v ~/.calcurse "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.calcurse ]]; then
        rm -v ~/.calcurse >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.calcurse ~/.calcurse >> "$LOGS"
}

# Newsboat (commons, private)
df_newsboat() {
    if [[ -e ~/.newsboat ]]; then
        mv -v ~/.newsboat "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.newsboat ]]; then
        rm -v ~/.newsboat >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.newsboat ~/.newsboat >> "$LOGS"
}

# vdirsyncer (commons, private)
df_vdirsyncer() {
    if [[ -e ~/.vdirsyncer ]]; then
        mv -v ~/.vdirsyncer "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.vdirsyncer ]]; then
        rm -v ~/.vdirsyncer >> "$LOGS"
    fi
    mkdir -v ~/.vdirsyncer >> "$LOGS"
    ln -s -v "${DOT}"/.vdirsyncer/config ~/.vdirsyncer/config >> "$LOGS"
}

# Khard (commons, private)
df_khard() {
    if [[ -e ~/.config/khard ]]; then
        mv -v ~/.config/khard "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.config/khard ]]; then
        rm -v ~/.config/khard >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.config/khard ~/.config/khard >> "$LOGS"
}

# linopen (commons, private)
df_linopen() {
    if [[ -e ~/.linopenrc ]]; then
        mv -v ~/.linopenrc "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.linopenrc ]]; then
        rm -v ~/.linopenrc >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.linopenrc ~/.linopenrc >> "$LOGS"
}

# SpaceVim (commons)
df_spacevim() {
    if [[ -e ~/.SpaceVim ]]; then
        mv -v ~/.SpaceVim.d "$BACKUP" >> "$LOGS"
    elif [[ -L ~/.SpaceVim ]]; then
        rm -v ~/.SpaceVim.d >> "$LOGS"
    fi
    {
        mkdir -v ~/.SpaceVim.d
        mkdir -v ~/.SpaceVim.d/autoload
        ln -s -v "${DOT}"/.SpaceVim.d/init.toml ~/.SpaceVim.d/init.toml
        ln -s -v "${DOT}"/.SpaceVim.d/autoload/config.vim ~/.SpaceVim.d/autoload/config.vim
    } >> "$LOGS"
}

# Neovim (commons)
df_neovim() {
    if [ -e ~/.config/nvim ]; then
        mv -v ~/.config/nvim "$BACKUP" >> "$LOGS"
    elif [ -L ~/.config/nvim ]; then
        rm -v ~/.config/nvim >> "$LOGS"
    fi
    {
        mkdir -v ~/.config/nvim
        mkdir -v ~/.config/nvim/plugins
        ln -s -v "${DOT}"/.config/nvim/init.vim ~/.config/nvim/init.vim
        ln -s -v "${DOT}"/.config/nvim/init-simple.vim ~/.config/nvim/init-simple.vim
        ln -s -v "${DOT}"/.config/nvim/projects.vim ~/.config/nvim/projects.vim
        ln -s -v "${DOT}"/.config/nvim/colors ~/.config/nvim/colors
    } >> "$LOGS"
}

# Tmuxp (private, commons)
df_tmuxp() {
    if [ -e ~/.tmuxp ]; then
        mv -v ~/.tmuxp "$BACKUP" >> "$LOGS"
    elif [ -L ~/.tmuxp ]; then
        rm -v ~/.tmuxp >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.tmuxp ~/.tmuxp >> "$LOGS"
}

# Abook (private, commons)
df_abook() {
    if [ -e ~/.abook ]; then
        mv -v ~/.abook "$BACKUP" >> "$LOGS"
    elif [ -L ~/.abook ]; then
        rm -v ~/.abook >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.abook ~/.abook >> "$LOGS"
}

# Transmission (private, commons)
df_transmission() {
    if [ -d ~/.config/transmission-daemon ]; then
        if [ -e ~/.config/transmission-daemon/settings.cfg ]; then
            mv -v ~/.config/transmission-daemon/settings.cfg "$BACKUP" >> "$LOGS"
        elif [ -L ~/.config/transmission-daemon/settings.cfg ]; then
            rm -b ~/.config/transmission-daemon/settings.cfg >> "$LOGS"
        fi
        ln -s -v "${DOT}"/.config/transmission-daemon/settings.cfg ~/.config/transmission-daemon/settings.cfg >> "$LOGS"
    else
        rm -v ~/.config/transmission-daemon >> "$LOGS"
        mkdir -v ~/.config/transmission-daemon >> "$LOGS"
        ln -s -v "${DOT}"/.config/transmission-daemon/settings.cfg ~/.config/transmission-daemon/settings.cfg >> "$LOGS"
    fi
}

# Tremc (private, commons)
df_tremc() {
    if [ -e ~/.config/tremc ]; then
        mv -v ~/.config/tremc "$BACKUP" >> "$LOGS"
    elif [ -L ~/.config/tremc ]; then
        rm -v ~/.config/tremc >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.config/tremc ~/.config/tremc >> "$LOGS"
}

# Ncmpcpp (private, commons)
df_ncmpcpp() {
    if [ -e ~/.ncmpcpp ]; then
        mv -v ~/.ncmpcpp "$BACKUP" >> "$LOGS"
    elif [ -L ~/.ncmpcpp ]; then
        rm -v ~/.ncmpcpp >> "$LOGS"
    fi
    {
        mkdir -v ~/.ncmpcpp
        ln -s -v "${DOT}"/.ncmpcpp/config ~/.ncmpcpp/config
        ln -s -v "${DOT}"/.ncmpcpp/bindings ~/.ncmpcpp/bindings
    } >> "$LOGS"
}

# Mopidy (private, commons)
df_mopidy() {
    if [ -e ~/.config/mopidy ]; then
        mv -v ~/.config/mopidy "$BACKUP" >> "$LOGS"
    elif [ -L ~/.config/mopidy ]; then
        rm -v ~/.config/mopidy >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.config/mopidy ~/.config/mopidy >> "$LOGS"
}

# lf (commons)
df_lf() {
    if [ -e ~/.config/lf ]; then
        mv -v ~/.config/lf "$BACKUP" >> "$LOGS"
    elif [ -L ~/.config/lf ]; then
        rm -v ~/.config/lf >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.config/lf ~/.config/lf >> "$LOGS"
}

# termite (commons)
df_termite() {
    if [ -e ~/.config/termite ]; then
        mv -v ~/.config/termite "$BACKUP" >> "$LOGS"
    elif [ -L ~/.config/termite ]; then
        rm -v ~/.config/termite >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.config/termite ~/.config/termite >> "$LOGS"
}

# twmn (commons)
df_twmn() {
    if [ -e ~/.config/twmn ]; then
        mv -v ~/.config/twmn "$BACKUP" >> "$LOGS"
    elif [ -L ~/.config/twmn ]; then
        rm -v ~/.config/twmn >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.config/twmn ~/.config/twmn >> "$LOGS"
}

# logiops (commons)
df_logiops() {
    if [ -e /etc/logid.cfg ]; then
        sudo mv -v /etc/logid.cfg "$BACKUP" >> "$LOGS"
    elif [ -L /etc/logid.cfg ]; then
        sudo rm -v /etc/logid.cfg >> "$LOGS"
    fi
    sudo ln -s -v "${DOT}"/etc/logid.cfg /etc/logid.cfg >> "$LOGS"
}

# npm (commons)
df_npm() {
    if [ -e ~/.npmrc ]; then
        mv -v ~/.npmrc "$BACKUP" >> "$LOGS"
    elif [ -L ~/.npmrc ]; then
        rm -v ~/.npmrc >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.npmrc ~/.npmrc >> "$LOGS"
    mkdir ~/.npm-global >> "$LOGS"
}

# WeeChat (commons, private)
df_weechat() {
    if [ -e ~/.weechat ]; then
        mv -v ~/.weechat "$BACKUP" >> "$LOGS"
    elif [ -L ~/.weechat ]; then
        rm -v ~/.weechat >> "$LOGS"
    fi
    ln -s -v "${DOT}"/.weechat ~/.weechat >> "$LOGS"
}


#┏━━━━━━━━━━━━━━━┓
#┃ Test function ┃
#┗━━━━━━━━━━━━━━━┛

df_test() {
    echo "Just test"
}

#┏━━━━━━┓
#┃ Help ┃
#┗━━━━━━┛

helps() {
    echo -e "\\e[0;34mＨｅｌｐ ━━━━━━━━━━━━━━━━"
    echo -e "\\e[1;36mScript installs dotfiles by making symlinks to the dotfiles directory."
    echo -e "\\e[1;36mOld dotfiles are backed up to home under backup-XXXXXX-directory."
    echo
    echo -e "\\e[1;35mUsage:\\e[0m ./install.sh <what-to-install> (required) <host> (optional)"
    echo
    echo -e "<what-to-install> is either group or single program. Some of single programs can take a"
    echo -e "host-parameter. If host-parameter is not set, installs only common dotfiles of program."
    echo -e "Host-groups installs ONLY host-specific files. Script must be in dotfiles root directory."
    echo -e "\\e[1;36mAlways install common files first! One group/program at a time!"
    echo
    echo -e "\\e[1;34mＡｖａｉｌａｂｌｅ  ｐａｒａｍｅｔｅｒｓ ━━━━━━━━━━━━━━━━\\e[0m"
    echo -e "\\e[1;35mPrivate(not found in git-repo), cant take host-parameter:\\e[0m df_irssi, df_buku,"
    echo -e "df_fonts, df_cursors, df_gtk_themes, df_fbcolors, df_calcurse, df_newsboat, df_vdirsyncer,"
    echo -e "df_khard, df_linopen, df_tmuxp, df_transmission, df_tremc, df_ncmpcpp, df_mopidy"
    echo
    echo -e "\\e[1;35mGroups:\\e[0m commons, commons_cli, commons_x11, host_r5, host_server, host_thinkpad"
    echo -e "assets(private)"
    echo
    echo -e "\\e[1;35mSingle programs that CANT take host-parameter:\\e[0m df_vim, df_tmux, df_screen, df_feh,"
    echo -e "df_less, df_zathura, df_vimb, df_picom, df_git, df_mpv, df_cmus, df_rtorrent, df_w3m,"
    echo -e "df_qutebrowser, df_gpg, df_rofipass, df_buku_run, df_mutt, df_hlwm, df_rofi, df_teiler,"
    echo -e "df_dunst, df_zsh, df_elinks, df_bspwm, df_xresources, df_spacevim, df_neovim, df_lf, df_termite"
    echo -e "df_twmn, df_logiops, df_npm, df_weechat"
    echo
    echo -e "\\e[1;35mSingle programs that CAN take host-parameter:\\e[0m df_i3, df_ranger"
    echo
    echo -e "\\e[1;35mSingle programs that MUST take host-parameter:\\e[0m df_i3blocks, df_xinit,"
    echo -e "df_gtk3, df_gtk2, df_xbindkeys, df_xmodmap, df_polybar, df_zprofile"
    echo
    echo -e "\\e[1;35mHosts(2nd parameter):\\e[0m r5, server, thinkpad"
}

#┏━━━━━━━┓
#┃ Error ┃
#┗━━━━━━━┛

errors() {
    echo -e "\\e[1;31m         ┳━┓┳━┓┳━┓┏━┓┳━┓\\e[0m"
    echo -e "\\e[1;31m         ┣━ ┃┳┛┃┳┛┃ ┃┃┳┛\\e[0m"
    echo -e "\\e[1;31m         ┻━┛┇┗┛┇┗┛┛━┛┇┗┛\\e[0m"
}

#┏━━━━━━━┓
#┃ Start ┃
#┗━━━━━━━┛

if [[ $# -eq 0 ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]] || [[ $1 == "help" ]]; then
    helps
    exit 0
elif ! isFunction "$1"; then
    errors
    echo -e "Invalid parameter \\e[1;35m$1\\e[0m. Use \\e[1;35m-h\\e[0m for help."
    exit 1
else
    [[ ! -z "$2" ]] && INSTALLED="$1 for $2" || INSTALLED="$1"
    printf "Are you sure you want to install \\e[1;35m%s\\e[0m (y/n) " "$INSTALLED"
    read -r SURE
    case $SURE in
        [yY]) echo ;;
        *) exit 0 ;;
    esac
    for value in {1..3}; do
        animate '             \e[1;35m  ' 0.1
        animate '             \e[0;35m░ ' 0.1
        animate '             \e[0;35m▒ ' 0.1
        animate '             \e[1;35m▓ ' 0.1
        animate '             \e[1;35m▋ ' 0.1
        animate '             \e[1;35m▓ ' 0.1
        animate '             \e[0;35m▒ ' 0.1
        animate '             \e[0;35m░ ' 0.1
    done
    animate '\e[1;31m' 0.1

    if [[ ! -e "$BACKUPROOT" ]]; then
        mkdir -p -v "$BACKUPROOT"
    fi
    mkdir -p "$BACKUP"

    if "$1" "$2"; then
        echo -e "\\e[1;32m            ┳━┓┏━┓┏┓┓┳━┓\\e[0m"
        echo -e "\\e[1;32m            ┃ ┃┃ ┃┃┃┃┣━\\e[0m"
        echo -e "\\e[1;32m            ┇━┛┛━┛┇┗┛┻━┛\\e[0m"
        echo -e "Succesfully installed \\e[1;35m${INSTALLED}\\e[0m"
        echo -e "Backup of old files can be found at \\e[1;35m${BACKUP}\\e[0m"
        echo -e "Logs can be found at \\e[1;35m${LOGS}\\e[0m"
        printf "Want to see logs now? (y/n) "
        read -r LOGANS
        case $LOGANS in
            [yY]) less "$LOGS" ;;
            *) exit 0 ;;
        esac
    else
        errors
        echo -e "Something went wrong during installation."
        echo -e "Backup of old files can be found at \\e[1;35m${BACKUP}\\e[0m"
        echo -e "Logs can be found at \\e[1;35m${LOGS}\\e[0m"
        printf "Want to see logs now? (y/n) "
        read -r LOGANS
        case $LOGANS in
            [yY]) less "$LOGS" ;;
            *) exit 1 ;;
        esac
    fi
fi
