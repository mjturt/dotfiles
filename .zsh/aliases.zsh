# ZSH aliases
# mjturt

alias ls="ls --color -F"
alias sl="ls --color -F"
alias ll="ls --color -lh"
alias la="ls --color -ah"
alias lla="ls --color -lah"

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
alias openports='ss --all --numeric --processes --ipv4 --ipv6'

alias twget="proxychains wget -c"
alias tcurl="proxychains curl"
alias torip="proxychains curl http://ipecho.net/plain; echo"

alias cls=' echo -ne "\033c" && rm ~/.zsh/history'
alias myip="curl http://ipecho.net/plain; echo"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias svim="sudo vim"
alias colors='for code ({000..255}) print -P -- "$code: %F{$code}COLORS%f"'
alias r="ranger-cd"
alias ev="vim ~/.vimrc"
alias vim-noswap='vim -n -i NONE --cmd "setlocal noswapfile" --cmd "set nocompatible" --cmd "set tabstop=4" -u NONE'
alias enfi="trans en:fi"
alias fien="trans fi:en"

alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tls="tmux list-sessions"
alias tlk="tmux list-keys"
alias tlkc="tmux list-keys -T copy-mode-vi"

alias fbvar="export TERM=fbterm"
alias c="pygmentize -O style=base16-monokai -f console256 -g"
alias notes="vim ~/cloud/rnotes"
alias gotop="gotop -c monokai"
alias changefont="printf '\e]710;%s\007'"

alias rustofat="toilet -f rustofat --gay"
alias wideterm="toilet -f wideterm --gay"

alias hc="herbstclient"

