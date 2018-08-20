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

animate () {
   echo -ne "     $1\033[0K\r"
   sleep $2
}

echo
echo -e "       \e[1;35m▛▀\e[1;31m▖▞\e[1;33m▀▖\e[1;32m▀▛\e[1;36m▘▛\e[0;34m▀▘\e[0;35m▜▘\e[0;31m▌ \e[0;33m ▛\e[0;32m▀▘\e[0;36m▞▀"
echo -e "       \e[1;31m▌ \e[0;34m▌▌ \e[0;32m▌ \e[0;36m▌\e[0;34m ▙\e[0;35m▄ \e[0;31m▐ \e[0;33m▌ \e[0;32m ▙\e[0;36m▄ \e[0;34m▚▄"
echo -e "       \e[1;33m▌ \e[0;32m▌▌ \e[0;36m▌ \e[0;34m▌\e[0;35m ▌  \e[0;33m▐ \e[0;32m▌ \e[0;36m ▌ \e[0;35m ▖ \e[0;31m▌"
echo -e "       \e[1;32m▀▀ \e[0;34m▝▀  \e[0;35m▘\e[0;31m ▘ \e[0;32m ▀▘\e[0;36m▀▀\e[0;34m▘▀\e[0;35m▀▘\e[0;31m▝▀"
sleep 0.1
echo -e "\e[1;30m     ──────────────────────────"
animate "\e[1;34mＩ\e[0m" 0.1
animate "\e[1;34mＩＮ\e[0m" 0.1
animate "\e[1;34mＩＮＳ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[1;35mＳ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[1;35mＳＣ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[1;35mＳＣＲ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[1;35mＳＣＲＩ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[1;35mＳＣＲＩＰ\e[0m" 0.1
animate "\e[1;34mＩＮＳＴＡＬＬ\e[1;35mＳＣＲＩＰＴ\e[0m" 0.1
echo
echo

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃ Variables and testing function ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

BACKUP=~/dotfiles-backup-$(date +%H%M%S)
LOGS=${BACKUP}/dotfiles-logs-$(date +%H%M%S).log
DOT=$(pwd)
isFunction() { [[ "$(declare -Ff "$1")" ]]; }

#┏━━━━━━━━┓
#┃ Groups ┃
#┗━━━━━━━━┛

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
   df_w3m
   df_gpg
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
   df_mpv
   df_cmus
   df_qutebrowser
   df_rofipass
   df_buku_run
   df_dunst
   df_teiler
   df_sxhkd
   df_hlwm
}

# Only host-specific files (R5)
host_r5 () {
   df_zprofile r5
   df_xresources r5
   df_i3 r5
   df_i3blocks r5
   df_ranger r5
   df_xinit r5
   df_xbindkeys r5
   df_gtk3 r5
   df_gtk2 r5
   df_buku
   df_pass
   df_bspwm r5
   df_polybar r5
}

# Only host-specific files (server)
host_server () {
   df_zprofile server
   df_ranger server
   df_rtorrent
   df_irssi
   df_mutt
}

# Only host-specific files (Thinkpad)
host_thinkpad () {
   df_zprofile thinkpad
   df_xresources thinkpad
   df_i3 thinkpad
   df_i3blocks thinkpad
   df_ranger thinkpad
   df_xinit thinkpad
   df_xbindkeys thinkpad
   df_gtk3 thinkpad
   df_gtk2 thinkpad
   df_xmodmap thinkpad
   df_buku
   df_pass
   df_bspwm thinkpad
   df_polybar thinkpad
}

# Private assets
assets () {
   df_fonts
   df_cursors
   df_gtk_themes
   df_fbcolors
}

#┏━━━━━━━━━━┓
#┃ Programs ┃
#┗━━━━━━━━━━┛

# ViM (commons)
df_vim () {
   if [[ -e ~/.vim ]]; then
      mv -v ~/.vim $BACKUP >> $LOGS
   elif [[ -L ~/.vim ]]; then
      rm -v ~/.vim >> $LOGS
   fi
   if [[ -e ~/.vimrc ]]; then
      mv -v ~/.vimrc $BACKUP >> $LOGS
   elif [[ -L ~/.vimrc ]]; then
      rm -v ~/.vimrc >> $LOGS
   fi
   if [[ -e ~/.gvimrc ]]; then
      mv -v ~/.gvimrc $BACKUP >> $LOGS
   elif [[ -L ~/.gvimrc ]]; then
      rm -v ~/.gvimrc >> $LOGS
   fi
   mkdir -v ~/.vim >> $LOGS
   mkdir -v ~/.vim/temp >> $LOGS
   mkdir -v ~/.vim/temp/backup >> $LOGS
   mkdir -v ~/.vim/temp/swap >> $LOGS
   mkdir -v ~/.vim/temp/undo >> $LOGS
   ln -v -s ${DOT}/.vimrc ~/.vimrc >> $LOGS
   ln -v -s ${DOT}/.vim/indent ~/.vim/indent >> $LOGS
   ln -v -s ${DOT}/.vim/appearance.vim ~/.vim/appearance.vim >> $LOGS
   ln -v -s ${DOT}/.vim/functions.vim ~/.vim/functions.vim >> $LOGS
   ln -v -s ${DOT}/.vim/keybindings.vim ~/.vim/keybindings.vim >> $LOGS
   ln -v -s ${DOT}/.vim/plugins.vim ~/.vim/plugins.vim >> $LOGS
   ln -v -s ${DOT}/.vim/projects.vim ~/.vim/projects.vim >> $LOGS
   ln -v -s ${DOT}/.gvimrc ~/.gvimrc >> $LOGS
}

# Tmux (commons)
df_tmux () {
   if [[ -e ~/.tmux.conf ]]; then
      mv -v ~/.tmux.conf $BACKUP >> $LOGS
   elif [[ -L ~/.tmux.conf ]]; then
      rm -v ~/.tmux.conf >> $LOGS
   fi
   ln -v -s ${DOT}/.tmux.conf ~/.tmux.conf >> $LOGS
}

# ZSH (commons)
df_zsh () {
   if [[ -e ~/.zsh ]]; then
      mv -v ~/.zsh $BACKUP >> $LOGS
   elif [[ -L ~/.zsh ]]; then
      rm -v ~/.zsh >> $LOGS
   fi
   if [[ -e ~/.zshrc ]]; then
      mv -v ~/.zshrc $BACKUP >> $LOGS
   elif [[ -L ~/.zshrc ]]; then
      rm -v ~/.zshrc >> $LOGS
   fi
   if [[ -e ~/.zsh/plugins ]]; then
      mv -v ~/.zsh/plugins $BACKUP >> $LOGS
   elif [[ -L ~/.zsh/plugins ]]; then
      rm -v ~/.zsh/plugins >> $LOGS
   fi
   mkdir -v ~/.zsh >> $LOGS
   ln -v -s ${DOT}/.zsh/completion ~/.zsh/completion >> $LOGS
   ln -v -s ${DOT}/.zsh/themes ~/.zsh/themes >> $LOGS
   ln -v -s ${DOT}/.zsh/aliases.zsh ~/.zsh/aliases.zsh >> $LOGS
   ln -v -s ${DOT}/.zsh/evars.zsh ~/.zsh/evars.zsh >> $LOGS
   ln -v -s ${DOT}/.zsh/functions.zsh ~/.zsh/functions.zsh >> $LOGS
   ln -v -s ${DOT}/.zsh/keybindings.zsh ~/.zsh/keybindings.zsh >> $LOGS
   ln -v -s ${DOT}/.zsh/dircolors ~/.zsh/dircolors >> $LOGS
   ln -v -s ${DOT}/.zsh/private.zsh ~/.zsh/private.zsh >> $LOGS
   ln -v -s ${DOT}/.zshrc ~/.zshrc >> $LOGS
   ln -v -s ${DOT}/.zsh/plugins ~/.zsh/plugins >> $LOGS
}

# zprofile (r5, server, thinkpad)
df_zprofile () {
      if [[ -e ~/.zprofile ]]; then
         mv -v ~/.zprofile $BACKUP >> $LOGS
      elif [[ -L ~/.zprofile ]]; then
         rm -v ~/.zprofile >> $LOGS
      fi
      if [[ "$1" = "r5" ]] || [[ "$1" = "thinkpad" ]]; then
         if [[ $(id -u) -eq 0 ]]; then
            ln -v -s ${DOT}/.zprofile-root ~/.zprofile >> $LOGS
         else
            ln -v -s ${DOT}/.zprofile ~/.zprofile >> $LOGS
         fi
      elif [[ "$1" = "server" ]]; then
         ln -v -s ${DOT}/server/.zprofile ~/.zprofile >> $LOGS
      fi
   }

# Ranger (commons, r5, server, thinkpad)
df_ranger () {
   if [[ -z "$1" ]]; then
      if [[ -e ~/.config/ranger ]]; then
         mv -v ~/.config/ranger $BACKUP >> $LOGS
      elif [[ -L ~/.config/ranger ]]; then
         rm -v ~/.config/ranger >> $LOGS
      fi
      mkdir -v ~/.config/ranger >> $LOGS
      mkdir -v ~/.config/ranger/colorschemes >> $LOGS
      mkdir -v ~/.config/ranger/plugins >> $LOGS
      ln -v -s ${DOT}/.config/ranger/rc.conf ~/.config/ranger/rc.conf >> $LOGS
      ln -v -s ${DOT}/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf >> $LOGS
      ln -v -s ${DOT}/.config/ranger/scope.sh ~/.config/ranger/scope.sh >> $LOGS
      chmod -v +x ~/.config/ranger/scope.sh >> $LOGS
      ln -v -s ${DOT}/.config/ranger/commands.py ~/.config/ranger/commands.py >> $LOGS
      ln -v -s ${DOT}/.config/ranger/devicons.py ~/.config/ranger/devicons.py >> $LOGS
      ln -v -s ${DOT}/.config/ranger/colorschemes/*.py ~/.config/ranger/colorschemes >> $LOGS
      ln -v -s ${DOT}/.config/ranger/plugins/*.py ~/.config/ranger/plugins >> $LOGS
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/ranger/bookmarks ]]; then
         mv -v ~/.config/ranger/bookmarks $BACKUP >> $LOGS
      elif [[ -L ~/.config/ranger/bookmarks ]]; then
         rm -v ~/.config/ranger/bookmarks >> $LOGS
      fi
      ln -v -s ${DOT}/.config/ranger/bookmarks ~/.config/ranger/bookmarks >> $LOGS
   elif [[ $1 == "server" ]]; then
      if [[ -e ~/.config/ranger/bookmarks ]]; then
         mv -v ~/.config/ranger/bookmarks $BACKUP >> $LOGS
      elif [[ -L ~/.config/ranger/bookmarks ]]; then
         rm -v ~/.config/ranger/bookmarks >> $LOGS
      fi
      ln -v -s ${DOT}/server/.config/ranger/bookmarks ~/.config/ranger/bookmarks >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/ranger/bookmarks ]]; then
         mv -v ~/.config/ranger/bookmarks $BACKUP >> $LOGS
      elif [[ -L ~/.config/ranger/bookmarks ]]; then
         rm -v ~/.config/ranger/bookmarks >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.config/ranger/bookmarks ~/.config/ranger/bookmarks >> $LOGS
   fi

}

# GNU Screen (commons)
df_screen () {
   if [[ -e ~/.screenrc ]]; then
      mv -v ~/.screenrc $BACKUP >> $LOGS
   elif [[ -L ~/.screenrc ]]; then
      rm -v ~/.screenrc >> $LOGS
   fi
   ln -v -s ${DOT}/.screenrc ~/.screenrc >> $LOGS
}

# GNU Less (commons)
df_less () {
   if [[ -e ~/.lesskey ]]; then
      mv -v ~/.lesskey $BACKUP >> $LOGS
   elif [[ -L ~/.lesskey ]]; then
      rm -v ~/.lesskey >> $LOGS
   fi
   if [[ -e ~/.lessfilter ]]; then
      mv -v ~/.lessfilter $BACKUP >> $LOGS
   elif [[ -L ~/.lessfilter ]]; then
      rm -v ~/.lessfilter >> $LOGS
   fi
   ln -v -s ${DOT}/.lesskey ~/.lesskey >> $LOGS
   ln -v -s ${DOT}/.lessfilter ~/.lessfilter >> $LOGS
   lesskey ~/.lesskey
   chmod -v +x ~/.lessfilter >> $LOGS >> $LOGS
}

# Scripts (commons)
df_scripts () {
   if [[ -e ~/bin ]]; then
      mv -v ~/bin $BACKUP >> $LOGS
   elif [[ -L ~/bin ]]; then
      rm -v ~/bin >> $LOGS
   fi
   if [[ -e ~/.statusscripts ]]; then
      mv -v ~/.statusscripts $BACKUP >> $LOGS
   elif [[ -L ~/.statusscripts ]]; then
      rm -v ~/.statusscripts >> $LOGS
   fi
   ln -v -s ${DOT}/scripts/bin ~/bin >> $LOGS
   ln -v -s ${DOT}/scripts/statusscripts ~/.statusscripts >> $LOGS
   chmod -v -R +x ~/bin/* >> $LOGS
   chmod -v -R +x ~/.statusscripts/* >> $LOGS
}

# Xresources (common, r5, thinkpad)
df_xresources () {
   if [[ -z "$1" ]]; then
      if [[ -e ~/.Xresources.d ]]; then
         mv -v ~/.Xresources.d $BACKUP >> $LOGS
      elif [[ -L ~/.Xresources.d ]]; then
         rm -v ~/.Xresources.d >> $LOGS
      fi
      if [[ -e ~/.Xresources ]]; then
         mv -v ~/.Xresources $BACKUP >> $LOGS
      elif [[ -L ~/.Xresources ]]; then
         rm -v ~/.Xresources >> $LOGS
      fi
      mkdir -v ~/.Xresources.d >> $LOGS
      ln -v -s ${DOT}/.Xresources ~/.Xresources >> $LOGS
      ln -v -s ${DOT}/.Xresources.d/colors ~/.Xresources.d/colors >> $LOGS
      ln -v -s ${DOT}/.Xresources.d/perl ~/.Xresources.d/perl >> $LOGS
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.Xresources.d/Xresources.host ]]; then
         mv -v ~/.Xresources.d/Xresources.host $BACKUP >> $LOGS
      elif [[ -L ~/.Xresources.d/Xresources.host ]]; then
         rm -v ~/.Xresources.d/Xresources.host >> $LOGS
      fi
      ln -v -s ${DOT}/.Xresources.d/Xresources.host ~/.Xresources.d/Xresources.host >> $LOGS
      xrdb ~/.Xresources
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.Xresources.d/Xresources.host ]]; then
         mv -v ~/.Xresources.d/Xresources.host $BACKUP >> $LOGS
      elif [[ -L ~/.Xresources.d/Xresources.host ]]; then
         rm -v ~/.Xresources.d/Xresources.host >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.Xresources.d/Xresources.host ~/.Xresources.d/Xresources.host >> $LOGS
      xrdb ~/.Xresources
   fi
}

# Rofi (commons)
df_rofi () {
   if [[ -e ~/.config/rofi ]]; then
      mv -v ~/.config/rofi $BACKUP >> $LOGS
   elif [[ -L ~/.config/rofi ]]; then
      rm -v ~/.config/rofi >> $LOGS
   fi
      mkdir -v ~/.config/rofi >> $LOGS
      ln -v -s ${DOT}/.config/rofi/themes ~/.config/rofi/themes >> $LOGS
      ln -v -s ${DOT}/.config/rofi/scripts ~/.config/rofi/scripts >> $LOGS
      ln -v -s ${DOT}/.config/rofi/config ~/.config/rofi/config >> $LOGS
      ln -v -s ${DOT}/.config/rofi/scripts/rofi-notes.sh ${DOT}/scripts/bin/rofi-notes >> $LOGS
      ln -v -s ${DOT}/.config/rofi/scripts/rofi-power.sh ${DOT}/scripts/bin/rofi-power >> $LOGS
}

# Feh (commons)
df_feh () {
   if [[ -e ~/.config/feh ]]; then
      mv -v ~/.config/feh $BACKUP >> $LOGS
   elif [[ -L ~/.config/feh ]]; then
      rm -v ~/.config/feh >> $LOGS
   fi
   ln -v -s ${DOT}/.config/feh ~/.config/feh >> $LOGS
}

# Zathura (commons)
df_zathura () {
   if [[ -e ~/.config/zathura ]]; then
      mv -v ~/.config/zathura $BACKUP >> $LOGS
   elif [[ -L ~/.config/zathura ]]; then
      rm -v ~/.config/zathura >> $LOGS
   fi
   ln -v -s ${DOT}/.config/zathura ~/.config/zathura >> $LOGS
}

# Compton (commons)
df_compton () {
   if [[ -e ~/.config/compton.conf ]]; then
      mv -v ~/.config/compton.conf $BACKUP >> $LOGS
   elif [[ -L ~/.config/compton.conf ]]; then
      rm -v ~/.config/compton.conf >> $LOGS
   fi
   ln -v -s ${DOT}/.config/compton.conf ~/.config/compton.conf >> $LOGS
}

# Vimb (commons)
df_vimb () {
   if [[ -e ~/.config/vimb ]]; then
      mv -v ~/.config/vimb $BACKUP >> $LOGS
   elif [[ -L ~/.config/vimb ]]; then
      rm -v ~/.config/vimb >> $LOGS
   fi
   mkdir -v ~/.config/vimb >> $LOGS
   ln -v -s ${DOT}/.config/vimb/config ~/.config/vimb/config >> $LOGS
   ln -v -s ${DOT}/.config/vimb/style.css ~/.config/vimb/style.css >> $LOGS
}

# Git (commons)
df_git () {
   if [[ -e ~/.gitconfig ]]; then
      mv -v ~/.gitconfig $BACKUP >> $LOGS
   elif [[ -L ~/.gitconfig ]]; then
      rm -v ~/.gitconfig >> $LOGS
   fi
   ln -v -s ${DOT}/.gitconfig ~/.gitconfig >> $LOGS
}

# i3 (commons, r5, thinkpad)
df_i3 () {
   if [[ -z "$1" ]]; then
      if [[ -e ~/.config/i3 ]]; then
         mv -v ~/.config/i3 $BACKUP >> $LOGS
      elif [[ -L ~/.config/i3 ]]; then
         rm -v ~/.config/i3 >> $LOGS
      fi
      mkdir -v ~/.config/i3 >> $LOGS
      ln -v -s ${DOT}/.config/i3/themes ~/.config/i3/themes >> $LOGS
   elif [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/i3/config ]]; then
         mv -v ~/.config/i3/config $BACKUP >> $LOGS
      elif [[ -L ~/.config/i3/config ]]; then
         rm -v ~/.config/i3/config >> $LOGS
      fi
      ln -v -s ${DOT}/.config/i3/config ~/.config/i3/config >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/i3/config ]]; then
         mv -v ~/.config/i3/config $BACKUP >> $LOGS
      elif [[ -L ~/.config/i3/config ]]; then
         rm -v ~/.config/i3/config >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.config/i3/config ~/.config/i3/config >> $LOGS
   fi
}

# i3blocks (r5, thinkpad)
df_i3blocks () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.i3blocks.conf ]]; then
         mv -v ~/.i3blocks.conf $BACKUP >> $LOGS
      elif [[ -L ~/.i3blocks.conf ]]; then
         rm -v ~/.i3blocks.conf >> $LOGS
      fi
      ln -v -s ${DOT}/.i3blocks.conf ~/.i3blocks.conf >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.i3blocks.conf ]]; then
         mv -v ~/.i3blocks.conf $BACKUP >> $LOGS
      elif [[ -L ~/.i3blocks.conf ]]; then
         rm -v ~/.i3blocks.conf >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.i3blocks.conf ~/.i3blocks.conf >> $LOGS
   fi
}

# Dunst (commons)
df_dunst () {
   if [[ -e ~/.config/dunst ]]; then
      mv -v ~/.config/dunst $BACKUP >> $LOGS
   elif [[ -L ~/.config/dunst ]]; then
      rm -v ~/.config/dunst >> $LOGS
   fi
   mkdir -v ~/.config/dunst >> $LOGS
   ln -v -s ${DOT}/.config/dunst/dunstrc ~/.config/dunst/dunstrc >> $LOGS
}

# Xinit (r5, thinkpad)
df_xinit () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.xinitrc ]]; then
         mv -v ~/.xinitrc $BACKUP >> $LOGS
      elif [[ -L ~/.xinitrc ]]; then
         rm -v ~/.xinitrc >> $LOGS
      fi
      ln -v -s ${DOT}/.xinitrc ~/.xinitrc >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.xinitrc ]]; then
         mv -v ~/.xinitrc $BACKUP >> $LOGS
      elif [[ -L ~/.xinitrc ]]; then
         rm -v ~/.xinitrc >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.xinitrc ~/.xinitrc >> $LOGS
   fi
}

# Xbindkeys (r5, thinkpad)
df_xbindkeys () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.xbindkeysrc ]]; then
         mv -v ~/.xbindkeysrc $BACKUP >> $LOGS
      elif [[ -L ~/.xbindkeysrc ]]; then
         rm -v ~/.xbindkeysrc >> $LOGS
      fi
      ln -v -s ${DOT}/.xbindkeysrc ~/.xbindkeysrc >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.xbindkeysrc ]]; then
         mv -v ~/.xbindkeysrc $BACKUP >> $LOGS
      elif [[ -L ~/.xbindkeysrc ]]; then
         rm -v ~/.xbindkeysrc >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.xbindkeysrc ~/.xbindkeysrc >> $LOGS
   fi
}

# GTK 3.0 (r5, thinkpad)
df_gtk3 () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.config/gtk-3.0 ]]; then
         mv -v ~/.config/gtk-3.0 $BACKUP >> $LOGS
      elif [[ -L ~/.config/gtk-3.0 ]]; then
         rm -v ~/.config/gtk-3.0 >> $LOGS
      fi
      mkdir -v ~/.config/gtk-3.0 >> $LOGS
      ln -v -s ${DOT}/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.config/gtk-3.0 ]]; then
         mv -v ~/.config/gtk-3.0 $BACKUP >> $LOGS
      elif [[ -L ~/.config/gtk-3.0 ]]; then
         rm -v ~/.config/gtk-3.0 >> $LOGS
      fi
      mkdir -v ~/.config/gtk-3.0 >> $LOGS
      ln -v -s ${DOT}/thinkpad/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini >> $LOGS
   fi
}

# GTK 2.0 (r5, thinkpad)
df_gtk2 () {
   if [[ $1 == "r5" ]]; then
      if [[ -e ~/.gtkrc-2.0 ]]; then
         mv -v ~/.gtkrc-2.0 $BACKUP >> $LOGS
      elif [[ -L ~/.gtkrc-2.0 ]]; then
         rm -v ~/.gtkrc-2.0 >> $LOGS
      fi
      ln -v -s ${DOT}/.gtkrc-2.0 ~/.gtkrc-2.0 >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.gtkrc-2.0 ]]; then
         mv -v ~/.gtkrc-2.0 $BACKUP >> $LOGS
      elif [[ -L ~/.gtkrc-2.0 ]]; then
         rm -v ~/.gtkrc-2.0 >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.gtkrc-2.0 ~/.gtkrc-2.0 >> $LOGS
   fi
}

# Xmodmap (thinkpad)
df_xmodmap () {
   if [[ $1 == "thinkpad" ]]; then
      if [[ -e ~/.Xmodmap ]]; then
         mv -v ~/.Xmodmap $BACKUP >> $LOGS
      elif [[ -L ~/.Xmodmap ]]; then
         rm -v ~/.Xmodmap >> $LOGS
      fi
      ln -v -s ${DOT}/thinkpad/.Xmodmap ~/.Xmodmap >> $LOGS
   fi
}

# Cmus (commons)
df_cmus () {
   if [[ -e ~/.config/cmus ]]; then
      mv -v ~/.config/cmus $BACKUP >> $LOGS
   elif [[ -L ~/.config/cmus ]]; then
      rm -v ~/.config/cmus >> $LOGS
   fi
   mkdir -v ~/.config/cmus >> $LOGS
   ln -s -v ${DOT}/.config/cmus/rc ~/.config/cmus/rc >> $LOGS
   ln -s -v ${DOT}/.config/cmus/scripts ~/.config/cmus/scripts >> $LOGS
}

# MPV (commons)
df_mpv () {
   if [[ -e ~/.config/mpv ]]; then
      mv -v ~/.config/mpv $BACKUP >> $LOGS
   elif [[ -L ~/.config/mpv ]]; then
      rm -v ~/.config/mpv >> $LOGS
   fi
   mkdir -v ~/.config/mpv >> $LOGS
   ln -s -v ${DOT}/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf >> $LOGS
   ln -s -v ${DOT}/.config/mpv/input.conf ~/.config/mpv/input.conf >> $LOGS
}

# rtorrent (commons)
df_rtorrent () {
   if [[ -e ~/.rtorrent.rc ]]; then
      mv -v ~/.rtorrent.rc $BACKUP >> $LOGS
   elif [[ -L ~/.rtorrent.rc ]]; then
      rm -v ~/.rtorrent.rc >> $LOGS
   fi
   ln -s -v ${DOT}/.rtorrent.rc ~/.rtorrent.rc >> $LOGS
}

# w3m (commons)
df_w3m () {
   if [[ -e ~/.w3m ]]; then
      mv -v ~/.w3m $BACKUP >> $LOGS
   elif [[ -L ~/.w3m ]]; then
      rm -v ~/.w3m >> $LOGS
   fi
   mkdir -v ~/.w3m >> $LOGS
   ln -s -v ${DOT}/.w3m/keymap ~/.w3m/keymap >> $LOGS
}

# qutebrowser (commons)
df_qutebrowser () {
   if [[ -e ~/.config/qutebrowser ]]; then
      mv -v ~/.config/qutebrowser $BACKUP >> $LOGS
   elif [[ -L ~/.config/qutebrowser ]]; then
      rm -v ~/.config/qutebrowser >> $LOGS
   fi
   mkdir -v ~/.config/qutebrowser >> $LOGS
   ln -s -v ${DOT}/.config/qutebrowser/config.py ~/.config/qutebrowser/config.py >> $LOGS
   ln -s -v ${DOT}/.config/qutebrowser/bookmarks ~/.config/qutebrowser/bookmarks >> $LOGS
   ln -s -v ${DOT}/.config/qutebrowser/quickmarks ~/.config/qutebrowser/quickmarks >> $LOGS
   ln -s -v ${DOT}/.config/qutebrowser/themes ~/.config/qutebrowser/themes >> $LOGS
   ln -s -v ${DOT}/.config/qutebrowser/userscripts ~/.config/qutebrowser/userscripts >> $LOGS
   ln -s -v ${DOT}/.config/qutebrowser/stylesheets ~/.config/qutebrowser/stylesheets >> $LOGS
}

# GPG (commons)
# This is little bit different because the nature of GPG
df_gpg () {
   if [[ ! -d ~/.gnupg ]]; then
      mkdir -v ~/.gnupg >> $LOGS
   fi
   if [[ -e ~/.gnupg/gpg.conf ]]; then
      mv -v ~/.gnupg/gpg.conf $BACKUP >> $LOGS
   elif [[ -L ~/.gnupg/gpg.conf ]]; then
      rm -v ~/.gnupg/gpg.conf >> $LOGS
   fi
   ln -s -v ${DOT}/.gnupg/gpg.conf ~/.gnupg/gpg.conf >> $LOGS
}

# Irssi (private, commons)
df_irssi () {
   if [[ -e ~/.irssi ]]; then
      mv -v ~/.irssi $BACKUP >> $LOGS
   elif [[ -L ~/.irssi ]]; then
      rm -v ~/.irssi >> $LOGS
   fi
   ln -s -v ${DOT}/.irssi ~/.irssi >> $LOGS
}

# Buku (private, commons)
df_buku () {
   if [[ -e ~/.local/share/buku/bookmarks.db ]]; then
      mv -v ~/.local/share/buku/bookmarks.db $BACKUP >> $LOGS
   elif [[ -L ~/.local/share/buku/bookmarks.db ]]; then
      rm -v ~/.local/share/buku/bookmarks.db >> $LOGS
   fi
   mkdir -v -p ~/.local/share/buku >> $LOGS
   ln -s -v ${DOT}/bookmarks.db ~/.local/share/buku/bookmarks.db >> $LOGS
}

# Pass (private, commons)
df_pass () {
   if [[ -e ~/.password-store ]]; then
      mv -v ~/.password-store $BACKUP >> $LOGS
   elif [[ -L ~/.password-store ]]; then
      rm -v ~/.password-store >> $LOGS
   fi
   ln -s -v ${DOT}/.password-store ~/.password-store >> $LOGS
}

# Rofi-pass (commons)
df_rofipass () {
   if [[ -e ~/.config/rofi-pass ]]; then
      mv -v ~/.config/rofi-pass $BACKUP >> $LOGS
   elif [[ -L ~/.config/rofi-pass ]]; then
      rm -v ~/.config/rofi-pass >> $LOGS
   fi
   mkdir -v ~/.config/rofi-pass >> $LOGS
   ln -s -v ${DOT}/.config/rofi-pass/config ~/.config/rofi-pass/config >> $LOGS
}

# buku_run (commons)
df_buku_run () {
   if [[ -e ~/.config/buku_run ]]; then
      mv -v ~/.config/buku_run $BACKUP >> $LOGS
   elif [[ -L ~/.config/buku_run ]]; then
      rm -v ~/.config/buku_run >> $LOGS
   fi
   mkdir -v ~/.config/buku_run >> $LOGS
   ln -s -v ${DOT}/.config/buku_run/config ~/.config/buku_run/config >> $LOGS
}

# Mutt (commons)
df_mutt () {
   if [[ -e ~/.mutt ]]; then
      mv -v ~/.mutt $BACKUP >> $LOGS
   elif [[ -L ~/.mutt ]]; then
      rm -v ~/.mutt >> $LOGS
   fi
   if [[ -e ~/.offlineimaprc ]]; then
      mv -v ~/.offlineimaprc $BACKUP >> $LOGS
   elif [[ -L ~/.offlineimaprc ]]; then
      rm -v ~/.offlineimaprc >> $LOGS
   fi
   if [[ -e ~/.offlineimap.py ]]; then
      mv -v ~/.offlineimap.py $BACKUP >> $LOGS
   elif [[ -L ~/.offlineimap.py ]]; then
      rm -v ~/.offlineimap.py >> $LOGS
   fi
   if [[ -e ~/.notmuch-config ]]; then
      mv -v ~/.notmuch-config $BACKUP >> $LOGS
   elif [[ -L ~/.notmuch-config ]]; then
      rm -v ~/.notmuch-config >> $LOGS
   fi
   if [[ ! -e ~/mail ]]; then
      mkdir -v ~/mail >> $LOGS
   fi
   mkdir -v ~/.mutt >> $LOGS
   mkdir -v -p ~/.mutt/cache/{utu,gmail}/{headers,messages} >> $LOGS
   ln -s -v ${DOT}/.mutt/muttrc ~/.mutt/muttrc >> $LOGS
   ln -s -v ${DOT}/.mutt/keybindings ~/.mutt/keybindings >> $LOGS
   ln -s -v ${DOT}/.mutt/mailcap ~/.mutt/mailcap >> $LOGS
   ln -s -v ${DOT}/.mutt/colors ~/.mutt/colors >> $LOGS
   ln -s -v ${DOT}/.mutt/mailboxes ~/.mutt/mailboxes >> $LOGS
   ln -s -v ${DOT}/.mutt/scripts ~/.mutt/scripts >> $LOGS
   ln -s -v ${DOT}/.mutt/accounts ~/.mutt/accounts >> $LOGS
   ln -s -v ${DOT}/.mutt/aliases ~/.mutt/aliases >> $LOGS
   ln -s -v ${DOT}/.mutt/signature ~/.mutt/signature >> $LOGS
   ln -s -v ${DOT}/.mutt/lists ~/.mutt/lists >> $LOGS
   ln -s -v ${DOT}/.mutt/offlineimap/offlineimaprc ~/.offlineimaprc >> $LOGS
   ln -s -v ${DOT}/.mutt/offlineimap/offlineimap.py ~/.offlineimap.py >> $LOGS
   ln -s -v ${DOT}/.mutt/notmuch-config ~/.notmuch-config >> $LOGS
}

# Polybar (r5, thinkpad)
df_polybar () {
   if [[ -e ~/.config/polybar ]]; then
      mv -v ~/.config/polybar $BACKUP >> $LOGS
   elif [[ -L ~/.config/polybar ]]; then
      rm -v ~/.config/polybar >> $LOGS
   fi
   mkdir -v ~/.config/polybar >> $LOGS
   if [[ $1 == "r5" ]]; then
      ln -s -v ${DOT}/.config/polybar/config.* ~/.config/polybar >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      ln -s -v ${DOT}/thinkpad/.config/polybar/config.* ~/.config/polybar >> $LOGS
   fi
}

# Herbstluftwm (commons)
df_hlwm () {
   if [[ -e ~/.config/herbstluftwm ]]; then
      mv -v ~/.config/herbstluftwm $BACKUP >> $LOGS
   elif [[ -L ~/.config/herbstluftwm ]]; then
      rm -v ~/.config/herbstluftwm >> $LOGS
   fi
   mkdir -v ~/.config/herbstluftwm >> $LOGS
   ln -s -v ${DOT}/.config/herbstluftwm/autostart ~/.config/herbstluftwm/autostart >> $LOGS
   ln -s -v ${DOT}/.config/herbstluftwm/scripts ~/.config/herbstluftwm/scripts >> $LOGS
}

# Teiler (commons)
df_teiler () {
   if [[ -e ~/.config/teiler ]]; then
      mv -v ~/.config/teiler $BACKUP >> $LOGS
   elif [[ -L ~/.config/teiler ]]; then
      rm -v ~/.config/teiler >> $LOGS
   fi
   mkdir -v ~/.config/teiler >> $LOGS
   ln -s -v ${DOT}/.config/teiler/config ~/.config/teiler/config >> $LOGS
}

# BSPWM (r5, thinkpad)
df_bspwm () {
   if [[ -e ~/.config/bspwm ]]; then
      mv -v ~/.config/bspwm $BACKUP >> $LOGS
   elif [[ -L ~/.config/bspwm ]]; then
      rm -v ~/.config/bspwm >> $LOGS
   fi
   mkdir -v ~/.config/bspwm >> $LOGS
   ln -s -v ${DOT}/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc >> $LOGS
   if [[ $1 == "r5" ]]; then
      ln -s -v ${DOT}/.config/bspwm/bspwmrc.host ~/.config/bspwm/bspwmrc.host >> $LOGS
   elif [[ $1 == "thinkpad" ]]; then
      ln -s -v ${DOT}/thinkpad/.config/bspwm/bspwmrc.host ~/.config/bspwm/bspwmrc.host >> $LOGS
   fi
}

# sxhkd (commons)
df_sxhkd () {
   if [[ -e ~/.config/sxhkd ]]; then
      mv -v ~/.config/sxhkd $BACKUP >> $LOGS
   elif [[ -L ~/.config/sxhkd ]]; then
      rm -v ~/.config/sxhkd >> $LOGS
   fi
   mkdir -v ~/.config/sxhkd >> $LOGS
   ln -s -v ${DOT}/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc >> $LOGS
}

# Fonts (private, commons)
# Global install!
df_fonts () {
   if [[ -e /usr/share/fonts/fontset ]]; then
      sudo mv -v /usr/share/fonts/fontset $BACKUP >> $LOGS
   elif [[ -L /usr/share/fonts/fontset ]]; then
      sudo rm -v /usr/share/fonts/fontset >> $LOGS
   fi
   sudo ln -s -v ${DOT}/assets/fontset /usr/share/fonts/fontset >> $LOGS
}

# Cursors (private, commons)
# Global install! Copy!
df_cursors () {
   if [[ -e /usr/share/cursors/xorg-x11 ]]; then
      sudo mv -v /usr/share/cursors/xorg-x11 $BACKUP >> $LOGS
   elif [[ -L /usr/share/cursors/xorg-x11 ]]; then
      sudo rm -v /usr/share/cursors/xorg-x11 >> $LOGS
   fi
   sudo mkdir -v -p /usr/share/cursors/xorg-x11 >> $LOGS
   sudo cp -R -v ${DOT}/assets/cursors/* /usr/share/cursors/xorg-x11 >> $LOGS
}

# GTK themes (private, commons)
# Copy!
df_gtk_themes () {
   if [[ -e ~/.themes ]]; then
      mv -v ~/.themes $BACKUP >> $LOGS
   elif [[ -L ~/.themes ]]; then
      rm -v ~/.themes >> $LOGS
   fi
   mkdir -v -p ~/.themes >> $LOGS
   cp -R -v ${DOT}/assets/gtk-themes/* ~/.themes >> $LOGS
}

# Console framebuffer colors (private, commons)
df_fbcolors () {
   if [[ -e ~/.fbcolors ]]; then
      mv -v ~/.fbcolors $BACKUP >> $LOGS
   elif [[ -L ~/.fbcolors ]]; then
      rm -v ~/.fbcolors >> $LOGS
   fi
   ln -s -v ${DOT}/assets/fbcolors ~/.fbcolors >> $LOGS
}

# Elinks (commons)
df_elinks () {
   if [[ -e ~/.elinks ]]; then
      mv -v ~/.elinks $BACKUP >> $LOGS
   elif [[ -L ~/.elinks ]]; then
      rm -v ~/.elinks >> $LOGS
   fi
   mkdir -v ~/.elinks >> $LOGS
   ln -s -v ${DOT}/.elinks/elinks.conf ~/.elinks/elinks.conf >> $LOGS
}

# Calcurse (commons, private)
df_calcurse () {
   if [[ -e ~/.calcurse ]]; then
      mv -v ~/.calcurse $BACKUP >> $LOGS
   elif [[ -L ~/.calcurse ]]; then
      rm -v ~/.calcurse >> $LOGS
   fi
   ln -s -v ${DOT}/.calcurse ~/.calcurse >> $LOGS
}

#┏━━━━━━┓
#┃ Help ┃
#┗━━━━━━┛

helps () {
   echo -e "\e[0;34mＨｅｌｐ ━━━━━━━━━━━━━━━━"
   echo -e "\e[1;36mScript installs dotfiles by making symlinks to the dotfiles directory."
   echo -e "\e[1;36mOld dotfiles are backed up to home under backup-XXXXXX-directory."
   echo
   echo -e "\e[1;35mUsage:\e[0m ./install.sh <what-to-install> (required) <host> (optional)"
   echo
   echo -e "<what-to-install> is either group or single program. Some of single programs can take a"
   echo -e "host-parameter. If host-parameter is not set, installs only common dotfiles of program."
   echo -e "Host-groups installs ONLY host-specific files. Script must be in dotfiles root directory."
   echo -e "\e[1;36mAlways install common files first! One group/program at a time!"
   echo
   echo -e "\e[1;34mＡｖａｉｌａｂｌｅ  ｐａｒａｍｅｔｅｒｓ ━━━━━━━━━━━━━━━━\e[0m" 
   echo -e "\e[1;35mPrivate(not found in git-repo), cant take host-parameter:\e[0m df_irssi, df_buku, df_pass"
   echo -e "df_fonts, df_cursors, df_gtk_themes, df_fbcolors, df_calcurse"
   echo
   echo -e "\e[1;35mGroups:\e[0m commons, commons_cli, commons_x11, host_r5, host_server, host_thinkpad"
   echo -e "assets(private)"
   echo
   echo -e "\e[1;35mSingle programs that CANT take host-parameter:\e[0m df_vim, df_tmux, df_screen, df_feh,"
   echo -e "df_less, df_zathura, df_vimb, df_compton, df_git, df_mpv, df_cmus, df_rtorrent, df_scripts,"
   echo -e "df_w3m, df_qutebrowser, df_gpg, df_rofipass, df_buku_run, df_mutt, df_hlwm, df_rofi, df_teiler,"
   echo -e "df_dunst, df_zsh, df_elinks"
   echo
   echo -e "\e[1;35mSingle programs that CAN take host-parameter:\e[0m df_xresources, df_i3, df_ranger"
   echo
   echo -e "\e[1;35mSingle programs that MUST take host-parameter:\e[0m df_i3blocks, df_xinit, df_bspwm"
   echo -e "df_gtk3, df_gtk2, df_xbindkeys, df_xmodmap, df_polybar, df_zprofile"
   echo
   echo -e "\e[1;35mHosts(2nd parameter):\e[0m r5, server, thinkpad"
}

#┏━━━━━━━┓
#┃ Error ┃
#┗━━━━━━━┛

errors () {
   echo -e "\e[1;31m         ┳━┓┳━┓┳━┓┏━┓┳━┓\e[0m"
   echo -e "\e[1;31m         ┣━ ┃┳┛┃┳┛┃ ┃┃┳┛\e[0m"
   echo -e "\e[1;31m         ┻━┛┇┗┛┇┗┛┛━┛┇┗┛\e[0m"
}

#┏━━━━━━━┓
#┃ Start ┃
#┗━━━━━━━┛

if [[ $# -eq 0 ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]] || [[ $1 == "help" ]]; then
   helps
   exit 0
elif ! isFunction "$1"; then
   errors
   echo -e "Invalid parameter \e[1;35m$1\e[0m. Use \e[1;35m-h\e[0m for help."
   exit 1
else
      [[ ! -z "$2" ]] && INSTALLED="$1 for $2" || INSTALLED="$1"
      printf "Are you sure you want to install \e[1;35m${INSTALLED}\e[0m (y/n) "; read SURE
      case $SURE in
      [yY]) echo ;; 
   *) exit 0 ;;
   esac
   for value in {1..3}
   do
      animate '             \e[1;33m\ ' 0.1
      animate '             \e[1;33m| ' 0.1
      animate '             \e[1;33m/ ' 0.1
      animate '             \e[1;33m- ' 0.1
   done
   animate '\e[1;31m' 0.1
   mkdir $BACKUP
   if $1 $2; then
      echo -e "\e[1;32m            ┳━┓┏━┓┏┓┓┳━┓\e[0m"
      echo -e "\e[1;32m            ┃ ┃┃ ┃┃┃┃┣━\e[0m"
      echo -e "\e[1;32m            ┇━┛┛━┛┇┗┛┻━┛\e[0m"
      echo -e "Succesfully installed \e[1;35m${INSTALLED}\e[0m"
      echo -e "Backup of old files can be found at \e[1;35m${BACKUP}\e[0m"
      echo -e "Logs can be found at \e[1;35m${LOGS}\e[0m"
      printf "Want to see logs now? (y/n) "; read LOGANS
      case $LOGANS in
         [yY]) less $LOGS ;; 
         *) exit 0 ;;
      esac
else
   errors
   echo -e "Something went wrong during installation."
   echo -e "Backup of old files can be found at \e[1;35m${BACKUP}\e[0m"
   echo -e "Logs can be found at \e[1;35m${LOGS}\e[0m"
   printf "Want to see logs now? (y/n) "; read LOGANS
   case $LOGANS in
      [yY]) less $LOGS ;; 
      *) exit 1 ;;
   esac
fi
fi
