#┃ ~/.zsh/themes/spaceship-settings.zsh
#┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

# Settings

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

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
                SPACESHIP_CHAR_COLOR_SUCCESS=212
            elif [ $(grep "Arch" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=033
            elif [ $(grep "Debian" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=052
            elif [ $(grep "Slackware" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=060
            elif [ $(grep "Ubuntu" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=166
            elif [ $(grep "Mint" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=040
            elif [ $(grep "suse" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=002
            elif [ $(grep "RHEL" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=088
            elif [ $(grep "Fedora" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=027
            elif [ $(grep "CentOS" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=154
            elif [ $(grep "Elementary" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=253
            elif [ $(grep "NixOS" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=074
            elif [ $(grep "Manjaro" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=040
            elif [ $(grep "Alpine" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=025
            elif [ $(grep "Devuan" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=059
            elif [ $(grep "Mageia" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=025
            elif [ $(grep "Sabayon" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=252
            elif [ $(grep "Raspbian" /etc/*-release | wc -l) -gt "0" ]
            then
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=125
            else
                # Distro cant be determined
                SPACESHIP_CHAR_SYMBOL=" "
                SPACESHIP_CHAR_COLOR_SUCCESS=253
            fi
            ;;
        "FreeBSD")
            SPACESHIP_CHAR_SYMBOL=" "
            SPACESHIP_CHAR_COLOR_SUCCESS=088
            ;;
        "Darwin")
            SPACESHIP_CHAR_SYMBOL=" "
            SPACESHIP_CHAR_COLOR_SUCCESS=250
            ;;
        "WindowsNT")
            SPACESHIP_CHAR_SYMBOL=" "
            SPACESHIP_CHAR_COLOR_SUCCESS=033
    esac
fi
