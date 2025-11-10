: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}
: ${HOSTFILE=~/.ssh/known_hosts}

#english lang
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}

export LANG LANGUAGE 



HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000


if [ -z $DISPLAY ]; then
  export DISPLAY="$(tail -1 /etc/resolv.conf | cut -d' ' -f2):0"
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"




# bring in system bashrc
test -r /etc/bashrc &&
    . /etc/bashrc

# shell opts. see bash(1) for details
shopt -s cdspell                 >/dev/null 2>&1  
shopt -s extglob                 >/dev/null 2>&1  
shopt -s hostcomplete            >/dev/null 2>&1  
shopt -u mailwarn                >/dev/null 2>&1

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

