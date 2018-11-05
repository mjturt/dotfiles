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
alias svim="sudo vim"
alias ev="vim ~/.vimrc"
alias vim-noswap='vim -n -i NONE --cmd "setlocal noswapfile" --cmd "set nocompatible" --cmd "set tabstop=4" -u NONE'

## Translate
alias enfi="trans en:fi"
alias fien="trans fi:en"

## Tmux
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tls="tmux list-sessions"
alias tlk="tmux list-keys"
alias tlkc="tmux list-keys -T copy-mode-vi"
alias tmux-d="tmux a -dt"

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

## Other
alias fbvar="export TERM=fbterm"
alias c="syntax-highlighting"
alias pyg="pygmentize -O style=base16-monokai -f console256 -g"
alias notes="ranger ~/cloud/rnotes"
alias gotop="gotop -c monokai"
alias changefont="printf '\e]710;%s\007'"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias colors='for code ({000..255}) print -P -- "$code: %F{$code}COLORS%f"'
alias r="ranger-cd"
alias hc="herbstclient"
alias git-chmod='git status --short | cut -d " " -f 3 | xargs chmod +x'
alias muttlocal="mutt -F ~/.mutt/muttrc-local"
