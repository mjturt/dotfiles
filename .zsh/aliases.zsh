#┃ ~/.zsh/aliases.zsh
#┣━━━━━━━━━━━━━━━━━━━
#┃ mjturt

## Coreutils
if [[ "$(uname)" == "FreeBSD" ]]; then
   LSCMD="gls"
else
   LSCMD="ls"
fi
alias ls="${LSCMD} --color -F"
alias sl="${LSCMD} --color -F"
alias ll="${LSCMD} --color -lh"
alias la="${LSCMD} --color -ah"
alias lla="${LSCMD} --color -lah"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias grep='grep --color=auto'
alias mv='nocorrect mv -i'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'
alias wget='noglob wget'

## Network
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias myip="curl http://ipecho.net/plain; echo"

## Tor
alias twget="proxychains wget -c"
alias tcurl="proxychains curl"
alias torip="proxychains curl http://ipecho.net/plain; echo"

## Vim
alias vim="nvim"
alias vmdiff="nvim -d"
alias svim="sudo nvim"
alias ev="nvim ~/.config/nvim/init.vim"
alias vim-noswap='nvim -n -i NONE --cmd "setlocal noswapfile" --cmd "set nocompatible" --cmd "set tabstop=4" -u NONE'
alias nvims="nvim -u ~/.config/nvim/init-simple.vim"
alias v="nvim"
alias vv="nvim -u ~/.config/nvim/init-simple.vim"

## Translate
alias enfi="trans en:fi"
alias fien="trans fi:en"
alias fipl="trans fi:pl"
alias plfi="trans pl:fi"

## Tmux
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tls="tmux list-sessions"
alias tlk="tmux list-keys"
alias tlkc="tmux list-keys -T copy-mode-vi"
alias tmux-d="tmux a -dt"
alias irs="tmux a -dt irssi"

## Toilet
alias rustofat="toilet -f rustofat --gay"
alias wideterm="toilet -f wideterm --gay"

## ZSH
alias plugins="/usr/local/bin/antibody bundle < ~/.zsh/plugins > ~/.zsh/plugins.sh"
alias cls=' echo -ne "\033c" && rm ~/.zsh/history'

## Gentoo
alias upgrade-gentoo="sudo emerge -uDU --keep-going --with-bdeps=y @world"
alias useflags="sudo vim /etc/portage/package.use/0custom"

## FreeBSD
alias ez="sudo ezjail-admin"

# Package managment
case $(uname) in
   "Linux")
      if grep -q Gentoo /etc/*-release; then
         alias pkgi="sudo emerge"
         alias pkgs="eix"
      elif grep -q Arch /etc/*-release; then
         alias pkgi="sudo pacman -S"
         alias pkgs="pacman -Ss"
      fi
      ;;
   "FreeBSD")
      alias pkgi="sudo pkg install"
      alias pkgs="pkg search"
      ;;
esac
alias worlds="ranger ~/cloud/txt/worlds"

## Mutt
alias muttlocal="mutt -F ~/.mutt/muttrc-local"
alias mutt="cd ~/cloud/attachments && neomutt"

# gcalcli
alias gcal-agenda="gcalcli agenda --color-owner=red --military"
alias gcal-thisweek="gcalcli calw --color-owner=red --military --monday"
alias gcal-nextweek="gcalcli calw \"next week\" --color-owner=red --military --monday"
alias gcal-add="gcalcli --calendar=\"maks.turtiainen@gmail.com\" add"

# GIT
alias git-chmod-plus='git status --short | cut -d " " -f 3 | xargs chmod +x'
alias git-chmod-minus='git status --short | cut -d " " -f 3 | xargs chmod -x'

# Environments
alias nvm-init="source /usr/share/nvm/init-nvm.sh"
alias env-init="source ~/dev/pythonenv/bin/activate"

# File managers
alias r="lf-cd"
alias f="fff-cd"

## Other
alias fbvar="export TERM=fbterm"
alias c="syntax-highlighting"
alias pyg="pygmentize -O style=base16-monokai -f console256 -g"
alias notes="ranger ~/cloud/Notes"
alias gotop="gotop -c monokai"
alias changefont="printf '\e]710;%s\007'"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias colors='for code ({000..255}) print -P -- "$code: %F{$code}COLORS%f"'
alias hc="herbstclient"
alias n="nvims ~/cloud/Notes/stuff.md"
