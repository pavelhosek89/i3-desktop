# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Custom bash prompt
GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\e[34m\]\u\[\e[97m\]\[\e[1m\] in \[\e[31m\]\w\[\e[0m\]$(__git_ps1 " \[\e[92m\][%s]\[\e[0m\]")\[\e[97m\] \[\e[1m\]\$\[\e[0m\] '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTSIZE=16384
HISTFILESIZE=65536

#disable duplicate entries in .bash_history
HISTCONTROL=ignoreboth
#ignore commands
HISTIGNORE="ll:ls:ls *:history:pwd:htop:pwqgen:pwqgen *:feh:pass:pass *:ranger:mount_disk:umount_disk:screenfetch:uptime:ip a"
#append to history, don't overwrite it
shopt -s histappend

# Prevent existing files from being overwritten by the shell's '>'
set -o noclobber

# User specific aliases and functions
alias ll='ls -lh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias which='type -a'

# Extracting
extract () {
 if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"

 fi
}

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
