# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Custom bash prompt
PS1='\[\e[34m\]\u\[\e[97m\]\[\e[1m\] in \[\e[31m\]\w$(__git_ps1)\[\e[97m\] \$\[\e[0m\] '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTSIZE=4096
HISTFILESIZE=16384

#disable duplicate entries in .bash_history
HISTCONTROL=ignoreboth:erasedups
#ignore commands
HISTIGNORE=history:ls*:pwd:mc:htop:pwqgen:feh
#datetime in history
HISTTIMEFORMAT="%h %d %H:%M:%S "
#append to history, don't overwrite it
shopt -s histappend

# User specific aliases and functions
alias ll='ls -l'
alias rm='rm -i'

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#mc solarized skin
export MC_SKIN=/home/phosek/.config/mc/solarized.ini
