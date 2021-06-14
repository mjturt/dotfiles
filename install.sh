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

#┏━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃ Variables and functions ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━┛

BACKUPROOT=~/.dotfiles-backup
BACKUP=${BACKUPROOT}/dotfiles-backup-$(date +%H%M%S)
LOGS=${BACKUP}/dotfiles-logs-$(date +%H%M%S).log
DOT=$(pwd)
isFunction() { [[ "$(declare -Ff "$1")" ]]; }

# file backup or symlink remove
backup_file() {
    if [[ -e "$1" ]]; then
        mv -v "$1" "$BACKUP" >> "$LOGS"
    elif [[ -L "$1" ]]; then
        rm -v "$1" >> "$LOGS"
    fi
}

#┏━━━━━━━━┓
#┃ Groups ┃
#┗━━━━━━━━┛

# installing common files
commons() {
    commons_cli
    commons_x11
}

# commons (cli)
commons_cli() {
    df_tmux
    df_tmuxp
    df_zsh
    df_less
    df_gpg
    df_git
    df_linopen
    df_elinks
    df_neovim
    df_mutt
    df_abook
    df_transmission
    df_tremc
    df_lf
    df_npm
    df_abook
}

# commons (x11)
commons_x11() {
    df_xresources
    df_rofi
    df_feh
    df_zathura
    df_picom
    df_mpv
    df_rofipass
    df_dunst
    df_teiler
    df_alacritty
    df_logiops
    df_betterlockscreen
    df_polybar
    df_fbcolors
}

# Only host-specific files (R5)
host_r5() {
    df_zprofile r5
    df_xinit r5
    df_xbindkeys r5
    df_i3 r5
}

# Only host-specific files (server)
host_server() {
    df_zprofile server
    df_weechat
}

# Only host-specific files (Thinkpad)
host_thinkpad() {
    df_zprofile thinkpad
    df_xinit thinkpad
    df_xbindkeys thinkpad
    df_xmodmap thinkpad
    df_i3 thinkpad
}

#┏━━━━━━━━━━┓
#┃ Programs ┃
#┗━━━━━━━━━━┛

# Tmux
df_tmux() {
    backup_file ~/.tmux.conf
    ln -v -s "${DOT}"/.tmux.conf ~/.tmux.conf >> "$LOGS"
}

# ZSH
df_zsh() {
    backup_file ~/.zsh
    backup_file ~/.zshrc
    backup_file ~/.zshenv
    {
        mkdir -v ~/.cache/zsh
        ln -v -s "${DOT}"/.zsh ~/.zsh
        ln -v -s "${DOT}"/.zshrc ~/.zshrc
        ln -v -s "${DOT}"/.zshenv ~/.zshenv
    } >> "$LOGS"
}

# zprofile
df_zprofile() {
    backup_file ~/.zprofile
    if [[ "$1" == "r5" ]] || [[ "$1" == "thinkpad" ]]; then
        ln -v -s "${DOT}"/.zprofile ~/.zprofile >> "$LOGS"
    elif [[ "$1" == "server" ]]; then
        ln -v -s "${DOT}"/server/.zprofile ~/.zprofile >> "$LOGS"
    fi
}

# GNU Less
df_less() {
    backup_file ~/.lesskey
    ln -v -s "${DOT}"/.lesskey ~/.lesskey >> "$LOGS"
    lesskey ~/.lesskey
}

# Xresources
df_xresources() {
    backup_file ~/.Xresources.d
    backup_file ~/.Xresources
    {
        ln -v -s "${DOT}"/.Xresources ~/.Xresources
        ln -v -s "${DOT}"/.Xresources.d ~/.Xresources.d
    } >> "$LOGS"
    xrdb ~/.Xresources
}

# Rofi
df_rofi() {
    backup_file ~/.config/rofi
    ln -v -s "${DOT}"/.config/rofi ~/.config/rofi >> "$LOGS"
}

# Feh
df_feh() {
    backup_file ~/.config/feh
    ln -v -s "${DOT}"/.config/feh ~/.config/feh >> "$LOGS"
}

# Zathura
df_zathura() {
    backup_file ~/.config/zathura
    ln -v -s "${DOT}"/.config/zathura ~/.config/zathura >> "$LOGS"
}

# Picom
df_picom() {
    backup_file ~/.config/picom.conf
    ln -v -s "${DOT}"/.config/picom.conf ~/.config/picom.conf >> "$LOGS"
}

# Git
df_git() {
    backup_file ~/.gitconfig
    backup_file ~/.gitignore_global
    ln -v -s "${DOT}"/.gitconfig ~/.gitconfig >> "$LOGS"
    ln -v -s "${DOT}"/.gitignore_global ~/.gitignore_global >> "$LOGS"
}

# i3
df_i3() {
    backup_file ~/.config/i3
    mkdir ~/.config/i3
    ln -v -s "${DOT}"/.config/i3/layouts ~/.config/i3/layouts >> "$LOGS"
    if [[ $1 == "r5" ]]; then
        cat "${DOT}"/.config/i3/config.base "${DOT}"/.config/i3/config.r5 > ~/.config/i3/config
    elif [[ $1 == "thinkpad" ]]; then
        cat "${DOT}"/.config/i3/config.base "${DOT}"/.config/i3/config.thinkpad > ~/.config/i3/config
    fi
}

# Dunst
df_dunst() {
    backup_file ~/.config/dunst
    ln -v -s "${DOT}"/.config/dunst ~/.config/dunst >> "$LOGS"
}

# Xinit
df_xinit() {
    backup_file ~/.xinitrc
    if [[ "$1" == "r5" || "$1" == "thinkpad" ]]; then
        sed -e "/# HOST_SPECIFIC/{r ${DOT}/xinitrc/.xinitrc.${1}" -e "d}" "${DOT}"/xinitrc/.xinitrc.base > ~/.xinitrc
        chmod +x ~/.xinitrc >> "$LOGS"
    fi
}

# Xbindkeys
df_xbindkeys() {
    backup_file ~/.xbindkeysrc
    if [[ "$1" == "r5" || "$1" == "thinkpad" ]]; then
        cat "${DOT}"/xbindkeysrc/.xbindkeysrc.base "${DOT}"/xbindkeysrc/.xbindkeysrc."${1}" > ~/.xbindkeysrc
    fi
}

# Xmodmap
df_xmodmap() {
    backup_file ~/.Xmodmap
    ln -v -s "${DOT}"/.Xmodmap ~/.Xmodmap >> "$LOGS"
}

# mpv
df_mpv() {
    backup_file ~/.config/mpv
    ln -s -v "${DOT}"/.config/mpv ~/.config/mpv >> "$LOGS"
}

# GPG
df_gpg() {
    if [[ ! -d ~/.gnupg ]]; then
        mkdir -v ~/.gnupg >> "$LOGS"
    fi
    backup_file ~/.gnupg/gpg.conf
    backup_file ~/.gnupg/gpg-agent.conf
    if [[ "$1" == "server" ]]; then
        ln -s -v "${DOT}"/server/.gnupg/gpg.conf ~/.gnupg/gpg.conf >> "$LOGS"
        ln -s -v "${DOT}"/server/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf >> "$LOGS"
    else
        ln -s -v "${DOT}"/.gnupg/gpg.conf ~/.gnupg/gpg.conf >> "$LOGS"
        ln -s -v "${DOT}"/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf >> "$LOGS"
    fi
}

# Rofi-pass
df_rofipass() {
    backup_file ~/.config/rofi-pass
    ln -s -v "${DOT}"/.config/rofi-pass ~/.config/rofi-pass >> "$LOGS"
}

# Mutt
df_mutt() {
    backup_file ~/.mutt
    backup_file ~/.mbsyncrc
    backup_file ~/.config/msmtp
    backup_file ~/.notmuch-config
    {
        mkdir -v -p ~/.local/share/mail/{utu,gmail,lvs}
        mkdir -v -p ~/.cache/mutt/{utu,gmail,lvs}/{headers,messages}
        ln -s -v "${DOT}"/.mutt ~/.mutt
        ln -s -v "${DOT}"/.notmuch-config ~/.notmuch-config
        ln -s -v "${DOT}"/.mbsyncrc ~/.mbsyncrc
        ln -s -v "${DOT}"/.config/msmtp ~/.config/msmtp
    } >> "$LOGS"
}

# Polybar
df_polybar() {
    backup_file ~/.config/polybar
    ln -s -v "${DOT}"/.config/polybar ~/.config/polybar >> "$LOGS"
}

# Teiler
df_teiler() {
    backup_file ~/.config/teiler
    ln -s -v "${DOT}"/.config/teiler ~/.config/teiler >> "$LOGS"
}

# Console colors
df_fbcolors() {
    backup_file ~/.fbcolors
    ln -s -v "${DOT}"/.fbcolors ~/.fbcolors >> "$LOGS"
}

# Elinks
df_elinks() {
    backup_file ~/.elinks
    ln -s -v "${DOT}"/.elinks ~/.elinks >> "$LOGS"
}

# linopen
df_linopen() {
    backup_file ~/.linopenrc
    ln -s -v "${DOT}"/.linopenrc ~/.linopenrc >> "$LOGS"
}

# Neovim
df_neovim() {
    backup_file ~/.config/nvim
    mkdir -v -p ~/.cache/nvim/{temp/{backup,swap,undo},plugins} >> "$LOGS"
    ln -s -v "${DOT}"/.config/nvim ~/.config/nvim >> "$LOGS"
}

# Tmuxp
df_tmuxp() {
    backup_file ~/.tmuxp
    ln -s -v "${DOT}"/.tmuxp ~/.tmuxp >> "$LOGS"
}

# Abook
df_abook() {
    backup_file ~/.abook
    ln -s -v "${DOT}"/.abook ~/.abook >> "$LOGS"
}

# Transmission
df_transmission() {
    backup_file ~/.config/transmission-daemon
    mkdir -v ~/.config/transmission-daemon >> "$LOGS"
    ln -s -v "${DOT}"/.config/transmission-daemon/settings.json ~/.config/transmission-daemon/settings.json >> "$LOGS"
}

# Tremc
df_tremc() {
    backup_file ~/.config/tremc
    ln -s -v "${DOT}"/.config/tremc ~/.config/tremc >> "$LOGS"
}

# lf
df_lf() {
    backup_file ~/.config/lf
    ln -s -v "${DOT}"/.config/lf ~/.config/lf >> "$LOGS"
}

# termite
df_termite() {
    backup_file ~/.config/termite
    ln -s -v "${DOT}"/.config/termite ~/.config/termite >> "$LOGS"
}

# alacritty
df_alacritty() {
    backup_file ~/.config/alacritty
    ln -s -v "${DOT}"/.config/alacritty ~/.config/alacritty >> "$LOGS"
}

# logiops
df_logiops() {
    if [ -e /etc/logid.cfg ]; then
        sudo mv -v /etc/logid.cfg "$BACKUP" >> "$LOGS"
    elif [ -L /etc/logid.cfg ]; then
        sudo rm -v /etc/logid.cfg >> "$LOGS"
    fi
    sudo ln -s -v "${DOT}"/etc/logid.cfg /etc/logid.cfg >> "$LOGS"
}

# npm
df_npm() {
    backup_file ~/.npmrc
    ln -s -v "${DOT}"/.npmrc ~/.npmrc >> "$LOGS"
    mkdir ~/.npm-global >> "$LOGS"
}

# weechat
df_weechat() {
    backup_file ~/.weechat
    ln -s -v "${DOT}"/.weechat ~/.weechat >> "$LOGS"
}

# betterlockscreen
df_betterlockscreen() {
    backup_file ~/.config/betterlockscreenrc
    ln -s -v "${DOT}"/.config/betterlockscreenrc ~/.config/betterlockscreenrc >> "$LOGS"
}

# autorandr
df_autorandr() {
    backup_file ~/.config/autorandr
    ln -s -v "${DOT}"/.config/autorandr ~/.config/autorandr >> "$LOGS"
}

# redshift
df_redshift() {
    backup_file ~/.config/redshift
    ln -s -v "${DOT}"/.config/redshift ~/.config/redshift >> "$LOGS"
}

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
    echo -e "\\e[1;35mPrivate(not found in git-repo), cant take host-parameter:\\e[0m"
    echo -e "df_fbcolors df_linopen, df_tmuxp, df_transmission, df_tremc"
    echo
    echo -e "\\e[1;35mGroups:\\e[0m commons, commons_cli, commons_x11, host_r5, host_server, host_thinkpad"
    echo
    echo -e "\\e[1;35mSingle programs that can't take host-parameter:\\e[0m"
    echo -e "df_less, df_zathura, df_picom, df_git, df_mpv, df_tmux, df_feh, df_betterlockscreen, df_polybar"
    echo -e "df_gpg, df_rofipass, df_mutt, df_rofi, df_teiler, df_npm, df_weechat, df_logiops"
    echo -e "df_dunst, df_zsh, df_elinks, df_xresources, df_neovim, df_lf, df_termite, df_autorandr"
    echo
    echo -e "\\e[1;35mSingle programs that must take host-parameter:\\e[0m"
    echo -e "df_xinit df_xbindkeys, df_xmodmap, df_zprofile, df_i3"
    echo
    echo -e "\\e[1;35mHosts(2nd parameter):\\e[0m r5, server, thinkpad"
}

#┏━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃ Some display functions ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━┛

errors() {
    echo -e "\\e[1;31m         ┳━┓┳━┓┳━┓┏━┓┳━┓\\e[0m"
    echo -e "\\e[1;31m         ┣━ ┃┳┛┃┳┛┃ ┃┃┳┛\\e[0m"
    echo -e "\\e[1;31m         ┻━┛┇┗┛┇┗┛┛━┛┇┗┛\\e[0m"
}

loader() {
    animate '  \e[0;35m░░░░░░░░░ ' 0.1
    animate '  \e[0;35m▓░░░░░░░░ ' 0.1
    animate '  \e[0;35m▓▓░░░░░░░ ' 0.1
    animate '  \e[0;35m▓▓▓░░░░░░ ' 0.1
    animate '  \e[0;35m▓▓▓▓░░░░░ ' 0.1
    animate '  \e[0;35m▓▓▓▓▓░░░░ ' 0.1
    animate '  \e[0;35m▓▓▓▓▓▓░░░ ' 0.1
    animate '  \e[0;35m▓▓▓▓▓▓▓░░ ' 0.1
    animate '  \e[0;35m▓▓▓▓▓▓▓▓░ ' 0.1
    animate '  \e[0;35m▓▓▓▓▓▓▓▓▓ ' 0.1
    animate '\e[1;31m' 0.1
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
    [[ -n "$2" ]] && INSTALLED="$1 for $2" || INSTALLED="$1"
    printf "Are you sure you want to install \\e[1;35m%s\\e[0m (y/n) " "$INSTALLED"
    read -r SURE
    case $SURE in
        [yY]) echo ;;
        *) exit 0 ;;
    esac
    loader

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
