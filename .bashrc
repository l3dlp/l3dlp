# ~/.bashrc: executed by bash(1) for non-login shells.

HISTSIZE=10000
HISTFILESIZE=10000000
HISTCONTROL=ignoreboth
HISTIGNORE="ls:ll:history"
CYAN=$(echo -e '\e[0;36m')
NORMAL=$(echo -e '\e[0m')
HISTTIMEFORMAT="${CYAN}[ %d/%m/%Y %H:%M:%S ]${NORMAL} "
PS1="\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[\033[38;5;226m\]@\[$(tput sgr0)\]\[\033[38;5;11m\]\h \[$(tput sgr0)\]\[\033[38;5;196m\]\w :\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

umask 022
export EDITOR="vim"
export GREP_COLOR=35

# Enhanced File Listing
alias ll="ls -lhaX --color=auto"
alias lx="ls -lha --color=auto"
alias grep='grep --color=auto'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

