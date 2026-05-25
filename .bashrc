# ________     _______       _________
# ___  __ \    ___    |____________  /______________________________
# __  / / /    __  /| |_  __ \  __  /_  _ \_  ___/_  ___/  _ \_  __ \
# _  /_/ /     _  ___ |  / / / /_/ / /  __/  /   _(__  )/  __/  / / /
# /_____/      /_/  |_/_/ /_/\__,_/  \___//_/    /____/ \___//_/ /_/
#
# (c) 2026 Derek Andersen
# https://www.github.com/Dechrissen
# https://www.derekandersen.net
#
# My personal .bashrc (for Arch Linux)

# TESSERACT path
export TESSERACT_PATH="/usr/bin/tesseract"
export TESSDATA_PREFIX="/usr/share/tesseract-ocr/5/tessdata/"

# PATH
NPATH="$HOME/.local/bin"

# add it only if required
case ":${PATH}:" in
  *:${NPATH}:*) ;;
  *) PATH=${PATH}:$NPATH ;;
esac

export PATH

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# environment variables
export bashrc='/home/derek/.bashrc'
export SSH='/home/derek/.ssh'
export EDITOR='vim'
export BROWSER='firefox' # one thing that uses this is newsboat (rss reader)

# --- prompt ---
# Function: hex → ANSI 24-bit color
hex_to_color() {
  local HEX="$1"
  local R=$((16#${HEX:0:2}))
  local G=$((16#${HEX:2:2}))
  local B=$((16#${HEX:4:2}))
  printf '\[\e[38;2;%d;%d;%dm\]' "$R" "$G" "$B"
}

# gruvbox material dark colors
_COLOR1="$(hex_to_color e78a4e)" # orange
_COLOR2="$(hex_to_color 7daea3)" # blue
_COLOR3="$(hex_to_color a9b665)" # green
_RESET="\[\e[0m\]"
PS1="${_COLOR1}\u${_RESET}@${_COLOR2}\h${_RESET} ${_COLOR3}\w${_RESET} \$ ${_RESET}"

# ignore case for tab-completion
bind "set completion-ignore-case on"

# File aliases
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# SSH aliases
alias banjovps='TERM=xterm-256color ssh -i ~/.ssh/banjo -p 801 dechrissen@banjospeedruns.com'
alias vps='TERM=xterm-256color ssh -i ~/.ssh/vps -p 8012 derek@derekandersen.net'

# Other aliases
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias c='clear'
alias ff='fastfetch'
alias define='dict -d wn' # define a word with the WordNet database

# Hyprland aliases
alias reload-waybar='killall -SIGUSR2 waybar'

# ThinkPad aliases
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage'"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# up and down arrow keys search history related to current partial input
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

source /usr/share/nvm/init-nvm.sh
