#┃ ~/.zsh/themes/spaceship-settings.zsh
#┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

# Settings

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_PREFIXES_SHOW=true

SPACESHIP_USER_SHOW="needed"
SPACESHIP_USER_PREFIX=""

SPACESHIP_HOST_PREFIX="@ "

SPACESHIP_DIR_PREFIX="["
SPACESHIP_DIR_SUFFIX="] "

SPACESHIP_EXEC_TIME_PREFIX=" "

SPACESHIP_GIT_PREFIX=""

SPACESHIP_GOLANG_SYMBOL=" "

SPACESHIP_PHP_SYMBOL=" "

SPACESHIP_NODE_SYMBOL=" "

SPACESHIP_DOCKER_SYMBOL=" "

# Section order

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  #hg            # Mercurial section (hg_branch  + hg_status)
  #package       # Package version
  #node          # Node.js section
  #ruby          # Ruby section
  #elixir        # Elixir section
  #xcode         # Xcode section
  #swift         # Swift section
  #golang        # Go section
  #php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  #julia         # Julia section
  #docker        # Docker section
  #aws           # Amazon Web Services section
  venv          # virtualenv section
  #conda         # conda virtualenv section
  #pyenv         # Pyenv section
  #dotnet        # .NET section
  #ember         # Ember.js section
  #kubecontext   # Kubectl context section
  #terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  #battery       # Battery level and status
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Prompt symbol

if [ "$TERM" = "linux" ]; then
    SPACESHIP_CHAR_SYMBOL="▲ "
else
    # OS test
    case $(uname) in
        "Linux")
            if [ $(grep "Gentoo" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=212
            elif [ $(grep "Arch" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=033
            elif [ $(grep "Debian" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=052
            elif [ $(grep "Slackware" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=060
            elif [ $(grep "Ubuntu" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=166
            elif [ $(grep "Mint" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=040
            elif [ $(grep "suse" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=002
            elif [ $(grep "RHEL" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=088
            elif [ $(grep "Fedora" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=027
            elif [ $(grep "CentOS" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=154
            elif [ $(grep "Elementary" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=253
            elif [ $(grep "NixOS" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=074
            elif [ $(grep "Manjaro" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=040
            elif [ $(grep "Alpine" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=025
            elif [ $(grep "Devuan" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=059
            elif [ $(grep "Mageia" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=025
            elif [ $(grep "Sabayon" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=252
            elif [ $(grep "Raspbian" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBOL_ROOT=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=125
            else
                # Distro cant be determined
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_SYMBO_ROOTL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=253
            fi
            ;;
        "FreeBSD")
            SPACESHIP_CHAR_SYMBOL=" "
            SPACESHIP_CHAR_SYMBOL_ROOT=" "
            SPACESHIP_CHAR_COLOR_SUCCESS=088
            ;;
        "Darwin")
            SPACESHIP_CHAR_SYMBOL=" "
            SPACESHIP_CHAR_SYMBOL_ROOT=" "
            SPACESHIP_CHAR_COLOR_SUCCESS=250
            ;;
        "WindowsNT")
            SPACESHIP_CHAR_SYMBOL=" "
            SPACESHIP_CHAR_SYMBOL_ROOT=" "
            SPACESHIP_CHAR_COLOR_SUCCESS=033
    esac
fi
