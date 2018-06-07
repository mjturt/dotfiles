#!/bin/sh
# Install script for mjturt's dotfiles

### Annoying starting animation

function animate {
   echo -$2e "     $1\033[0K\r"
   sleep 0.1
}

echo
echo -e "       \e[1;32m▛▀▖▞▀▖▀▛▘\e[0;34m▛▀▘▜▘▌  ▛▀▘▞▀"
echo -e "       \e[1;32m▌ ▌▌ ▌ ▌\e[0;34m ▙▄ ▐ ▌  ▙▄ ▚▄"
echo -e "       \e[1;32m▌ ▌▌ ▌ ▌\e[0;34m ▌  ▐ ▌  ▌  ▖ ▌"
echo -e "       \e[1;32m▀▀ ▝▀  ▘\e[0;34m ▘  ▀▘▀▀▘▀▀▘▝▀"
sleep 0.1
echo -e "\e[1;30m     --------------------------"
animate "\e[1;31mＩ\e[0m" n
animate "\e[1;31mＩＮ\e[0m" n
animate "\e[1;31mＩＮＳ\e[0m" n
animate "\e[1;31mＩＮＳＴ\e[0m" n
animate "\e[1;31mＩＮＳＴＡ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[1;33mＳ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[1;33mＳＣ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[1;33mＳＣＲ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[1;33mＳＣＲＩ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[1;33mＳＣＲＩＰ\e[0m" n
animate "\e[1;31mＩＮＳＴＡＬＬ\e[1;33mＳＣＲＩＰＴ\e[0m" n
echo
echo

# Variables and testing function

BACKUP=~/dotfiles-backup-$(date +%H%M%S)
DOT=$(pwd)
isFunction() { [[ "$(declare -Ff "$1")" ]]; }

### Groups

# Installing common files
commons () {
   commons_cli
   commons_x11
}

# Commons, but only command line programs
commons_cli () {
   df_vim
   df_tmux
   df_zsh
   df_ranger
   df_screen
   df_less
   df_git
   df_scripts
}

# Commons, but only graphical programs
commons_x11 () {
   df_xresources
   df_rofi
   df_feh
   df_zathura
   df_compton
   df_vimb
   df_i3
}

# Only host-specific files (R5)
host_r5 () {
   df_zsh r5
   df_xresources r5
   df_i3 r5
   df_i3blocks r5
   df_ranger r5
   df_rofi r5
   df_dunst r5
   df_xinit r5
   df_xbindkeys r5
   df_gtk3 r5
   df_gtk2 r5
}

# Only host-specific files (server)
hostserver () {
   df_zsh server
   df_ranger server
}

# Only host-specific files (Thinkpad)
host_thinkpad () {
   df_zsh thinkpad
   df_xresources thinkpad
   df_i3 thinkpad
   df_i3blocks thinkpad
   df_ranger thinkpad
   df_rofi thinkpad
   df_dunst thinkpad
   df_xinit thinkpad
   df_xbindkeys thinkpad
   df_gtk3 thinkpad
   df_gtk2 thinkpad
   df_xmodmap thinkpad
}

### Programs

# ViM (commons)
df_vim () {
   if [[ -e ~/.vim ]]; then
      mv ~/.vim $BACKUP
   fi
   if [[ -e ~/.vimrc ]]; then
      mv ~/.vimrc $BACKUP
   fi
   if [[ -e ~/.gvimrc ]]; then
      mv ~/.gvimrc $BACKUP
   fi
   mkdir ~/.vim
   ln -s ${DOT}/.vimrc ~/.vimrc
   ln -s ${DOT}/.vim/indent ~/.vim/indent
   ln -s ${DOT}/.vim/projects.vim ~/.vim/projects.vim
   ln -s ${DOT}/.gvimrc ~/.gvimrc
}

# Tmux (commons)
df_tmux () {
   if [[ -e ~/.tmux.conf ]]; then
      mv ~/.tmux.conf $BACKUP
   fi
   ln -s ${DOT}/.tmux.conf ~/.tmux.conf
}

# ZSH (commons, r5, server, thinkpad)
df_zsh () {
   if [[ $1 -eq 0 ]]; then
      if [[ -e ~/.zsh ]]; then
         mv ~/.zsh $BACKUP
      fi
      mkdir ~/.zsh
      ln -s ${DOT}/.zsh/completion ~/.zsh/completion
      ln -s ${DOT}/.zsh/themes ~/.zsh/themes
      ln -s ${DOT}/.zsh/aliases.zsh ~/.zsh/aliases.zsh
      ln -s ${DOT}/.zsh/evars.zsh ~/.zsh/evars.zsh
      ln -s ${DOT}/.zsh/functions.zsh ~/.zsh/functions.zsh
      ln -s ${DOT}/.zsh/keybindings.zsh ~/.zsh/keybindings.zsh
      ln -s ${DOT}/.zsh/private.zsh ~/.zsh/private.zsh
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.zshrc ]]; then
         mv ~/.zshrc $BACKUP
      fi
      if [[ -e ~/.zsh/plugins ]]; then
         mv ~/.zsh/plugins $BACKUP
      fi
      if [[ -e ~/.zprofile ]]; then
         mv ~/.zprofile $BACKUP
      fi
      ln -s ${DOT}/.zshrc ~/.zshrc
      ln -s ${DOT}/.zsh/plugins ~/.zsh/plugins
      ln -s ${DOT}/.zprofile ~/.zprofile
   elif [[ $1 == "server" ]]; then
      if [[ -e ~/.zshrc ]]; then
         mv ~/.zshrc $BACKUP
      fi
      if [[ -e ~/.zprofile ]]; then
         mv ~/.zprofile $BACKUP
      fi
      ln -s ${DOT}/server/.zshrc ~/.zshrc
      ln -s ${DOT}/server/.zprofile ~/.zprofile
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.zshrc ]]; then
         mv ~/.zshrc $BACKUP
      fi
      if [[ -e ~/.zprofile ]]; then
         mv ~/.zprofile $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.zshrc ~/.zshrc
      ln -s ${DOT}/thinkpad/.zprofile ~/.zprofile
   fi
}

# Ranger (commons, r5, server, thinkpad)
df_ranger () {
   if [[ $1 -eq 0 ]]; then
      if [[ -e ~/.config/ranger ]]; then
         mv ~/.config/ranger $BACKUP
      fi
      mkdir ~/.config/ranger
      mkdir ~/.config/ranger/colorschemes
      mkdir ~/.config/ranger/plugins
      ln -s ${DOT}/.config/ranger/rc.conf ~/.config/ranger/rc.conf
      ln -s ${DOT}/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf
      ln -s ${DOT}/.config/ranger/scope.conf ~/.config/ranger/scope.conf
      ln -s ${DOT}/.config/ranger/commands.py ~/.config/ranger/commands.py
      ln -s ${DOT}/.config/ranger/devicons.py ~/.config/ranger/devicons.py
      ln -s ${DOT}/.config/ranger/colorschemes/*.py ~/.config/ranger/colorschemes
      ln -s ${DOT}/.config/ranger/plugins/*.py ~/.config/ranger/plugins
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/ranger/bookmarks ]]; then
         mv ~/.config/ranger/bookmarks $BACKUP
      fi
      ln -s ${DOT}/.config/ranger/bookmarks ~/.config/ranger/bookmarks
   elif [[ $1 == "server" ]]; then
      if [[ -e ~/.config/ranger/bookmarks ]]; then
         mv ~/.config/ranger/bookmarks $BACKUP
      fi
      ln -s ${DOT}/server/.config/ranger/bookmarks ~/.config/ranger/bookmarks
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/ranger/bookmarks ]]; then
         mv ~/.config/ranger/bookmarks $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.config/ranger/bookmarks ~/.config/ranger/bookmarks
   fi

}

# GNU Screen (commons)
df_screen () {
   if [[ -e ~/.screenrc ]]; then
      mv ~/.screenrc $BACKUP
   fi
   ln -s ${DOT}/.screenrc ~/.screenrc
}

# GNU Less (commons)
df_less () {
   if [[ -e ~/.lesskey ]]; then
      mv ~/.lesskey $BACKUP
   fi
   if [[ -e ~/.lessfilter ]]; then
      mv ~/.lessfilter $BACKUP
   fi
   ln -s ${DOT}/.lesskey ~/.lesskey
   ln -s ${DOT}/.lessfilter ~/.lessfilter
   lesskey ~/.lesskey
}

# Scripts (commons)
df_scripts () {
   if [[ -e ~/bin ]]; then
      mv ~/bin $BACKUP
   fi
   if [[ -e ~/.statusscripts ]]; then
      mv ~/.statusscripts $BACKUP
   fi
   ln -s ${DOT}/scripts/bin ~/bin
   ln -s ${DOT}/scripts/bin ~/cloud/bin
   ln -s ${DOT}/scripts/statusscripts ~/.statusscripts
}

# Xresources (common, r5, thinkpad)
df_xresources () {
   if [[ $1 -eq 0 ]]; then
      if [[ -e ~/.Xresources.d ]]; then
         mv ~/.Xresources.d $BACKUP
      fi
      if [[ -e ~/.Xresources ]]; then
         mv ~/.Xresources $BACKUP
      fi
      mkdir ~/.Xresources.d
      ln -s ${DOT}/.Xresources ~/.Xresources
      ln -s ${DOT}/.Xresources.d/colors ~/.Xresources.d/colors
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.Xresources.d/Xresources.host ]]; then
         mv ~/.Xresources.d/Xresources.host $BACKUP
      fi
      ln -s ${DOT}/.Xresources.d/Xresources.host ~/.Xresources.d/Xresources.host
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.Xresources.d/Xresources.host ]]; then
         mv ~/.Xresources.d/Xresources.host $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.Xresources.d/Xresources.host ~/.Xresources.d/Xresources.host
   fi
}

# Rofi (commons, r5, thinkpad)
df_rofi () {
   if [[ $1 -eq 0 ]]; then
      if [[ -e ~/.config/rofi ]]; then
         mv ~/.config/rofi $BACKUP
      fi
      mkdir ~/.config/rofi
      ln -s ${DOT}/.config/rofi/themes ~/.config/rofi/themes
      ln -s ${DOT}/.config/rofi/scripts ~/.config/rofi/scripts
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/rofi/config ]]; then
         mv ~/.config/rofi/config $BACKUP
      fi
      ln -s ${DOT}/.config/rofi/config ~/.config/rofi/config
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/rofi/config ]]; then
         mv ~/.config/rofi/config $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.config/rofi/config ~/.config/rofi/config
   fi
}

# Feh (commons)
df_feh () {
   if [[ ~/.config/feh ]]; then
      mv ~/.config/feh $BACKUP
   fi
   ln -s ${DOT}/.config/feh ~/.config/feh
}

# Zathura (commons)
df_zathura () {
   if [[ -e ~/.config/zathura ]]; then
      mv ~/.config/zathura $BACKUP
   fi
   ln -s ${DOT}/.config/zathura ~/.config/zathura
}

# Compton (commons)
df_compton () {
   if [[ -e ~/.config/compton.conf ]]; then
      mv ~/.config/compton.conf $BACKUP
   fi
   ln -s ${DOT}/.config/compton.conf ~/.config/compton.conf
}

# Vimb (commons)
df_vimb () {
   if [[ -e ~/.config/vimb ]]; then
      mv ~/.config/vimb $BACKUP
   fi
   mkdir ~/.config/vimb
   ln -s ${DOT}/.config/vimb/config ~/.config/vimb/config
   ln -s ${DOT}/.config/vimb/style.css ~/.config/vimb/style.css
}

# Git (commons)
df_git () {
   if [[ -e ~/.gitconfig ]]; then
      mv ~/.gitconfig $BACKUP
   fi
   ln -s ${DOT}/.gitconfig ~/.gitconfig
}

# i3 (commons, r5, thinkpad)
df_i3 () {
   if [[ $1 -eq 0 ]]; then
      if [[ -e ~/.config/i3 ]]; then
         mv ~/.config/i3 $BACKUP
      fi
      mkdir ~/.config/i3
      ln -s ${DOT}/.config/i3/themes ~/.config/i3/themes
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/i3/config ]]; then
         mv ~/.config/i3/config $BACKUP
      fi
      ln -s ${DOT}/.config/i3/config ~/.config/i3/config
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/i3/config ]]; then
         mv ~/.config/i3/config $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.config/i3/config ~/.config/i3/config
   fi
}

# i3blocks (r5, thinkpad)
df_i3blocks () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.i3blocks.conf ]]; then
         mv ~/.i3blocks.conf $BACKUP
      fi
      ln -s ${DOT}/.i3blocks.conf ~/.i3blocks.conf
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.i3blocks.conf ]]; then
         mv ~/.i3blocks.conf $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.i3blocks.conf ~/.i3blocks.conf
   fi
}

# Dunst (r5, thinkpad)
df_dunst () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/dunst ]]; then
         mv ~/.config/dunst $BACKUP
      fi
      mkdir ~/.config/dunst
      ln -s ${DOT}/.config/dunst/dunstrc ~/.config/dunst/dunstrc
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/dunst ]]; then
         mv ~/.config/dunst $BACKUP
      fi
      mkdir ~/.config/dunst
      ln -s ${DOT}/thinkpad/.config/dunst/dunstrc ~/.config/dunst/dunstrc
   fi
}

# Xinit (r5, thinkpad)
df_xinit () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.xinitrc ]]; then
         mv ~/.xinitrc $BACKUP
      fi
      ln -s ${DOT}/.xinitrc ~/.xinitrc
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.xinitrc ]]; then
         mv ~/.xinitrc $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.xinitrc ~/.xinitrc
   fi
}

# Xbindkeys (r5, thinkpad)
df_xbindkeys () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.xbindkeysrc ]]; then
         mv ~/.xbindkeysrc $BACKUP
      fi
      ln -s ${DOT}/.xbindkeysrc ~/.xbindkeysrc
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.xbindkeysrc ]]; then
         mv ~/.xbindkeysrc $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.xbindkeysrc ~/.xbindkeysrc
   fi
}

# GTK 3.0 (r5, thinkpad)
df_gtk3 () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/gtk-3.0 ]]; then
         mv ~/.config/gtk-3.0 $BACKUP
      fi
      mkdir ~/.config/gtk-3.0
      ln -s ${DOT}/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/gtk-3.0 ]]; then
         mv ~/.config/gtk-3.0 $BACKUP
      fi
      mkdir ~/.config/gtk-3.0
      ln -s ${DOT}/thinkpad/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
   fi
}

# GTK 2.0 (r5, thinkpad)
df_gtk2 () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.gtkrc-2.0 ]]; then
         mv ~/.gtkrc-2.0 $BACKUP
      fi
      ln -s ${DOT}/.gtkrc-2.0 ~/.gtkrc-2.0
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.gtkrc-2.0 ]]; then
         mv ~/.gtkrc-2.0 $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.gtkrc-2.0 ~/.gtkrc-2.0
   fi
}

# Xmodmap (thinkpad)
df_xmodmap () {
   if [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.Xmodmap ]]; then
         mv ~/.Xmodmap $BACKUP
      fi
      ln -s ${DOT}/thinkpad/.Xmodmap ~/.Xmodmap
   fi
}

### Help

helps () {
   echo -e "\e[0;34mＨＥＬＰ ━━━━━━━━━━━━━━━━"
   echo -e "\e[1;36mScript installs dotfiles by making symlinks to the dotfiles directory."
   echo -e "\e[1;36mOld dotfiles are backed up to home under backup-XXXXXX-directory."
   echo
   echo -e "\e[1;35mUsage:\e[0m ./install.sh <what-to-install> (required) <host> (optional)"
   echo
   echo -e "<what-to-install> is either group or single program. Some of single programs can take a"
   echo -e "host-parameter. If host-parameter is not set, installs only common dotfiles of program."
   echo -e "Script must be in dotfiles root directory."
   echo -e "\e[1;36mAllways install common files first! One group/program at a time!"
   echo
   echo -e "\e[1;34mＡｖａｉｌａｂｌｅ  ｐａｒａｍｅｔｅｒｓ ━━━━━━━━━━━━━━━━\e[0m" 
   echo -e "\e[1;35mGroups:\e[0m commons, commons_cli, commons_x11, host_r5, host_server, host_thinkpad"
   echo
   echo -e "\e[1;35mSingle programs that CANT take host-parameter:\e[0m df_vim, df_tmux, df_screen, df_feh,"
   echo -e "df_less, df_zathura, df_vimb, df_compton, df_scripts"
   echo
   echo -e "\e[1;35mSingle programs that CAN take host-parameter:\e[0m df_zsh, df_xresources, df_i3, df_rofi,"
   echo -e "df_ranger"
   echo
   echo -e "\e[1;35mSingle programs that MUST take host-parameter:\e[0m df_i3blocks, df_dunst, df_xinit,"
   echo -e "df_gtk3, df_gtk2, df_xbindkeys, df_xmodmap"
   echo
   echo -e "\e[1;35mHosts(2nd parameter):\e[0m r5, server, thinkpad"
}

### Start

if [[ $# -eq 0 ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
   helps
   exit 0
elif ! isFunction "$1"; then
   echo -e "\e[1;91m         ┏━╸┏━┓┏━┓┏━┓┏━┓\e[0m"
   echo -e "\e[1;91m         ┣╸ ┣┳┛┣┳┛┃ ┃┣┳┛\e[0m"
   echo -e "\e[1;91m         ┗━╸╹┗╸╹┗╸┗━┛╹┗╸\e[0m"
   echo -e "Invalid parameter. Use -h for help."
   exit 1
else
   mkdir $BACKUP
   $1 $2
   exit 0
fi
