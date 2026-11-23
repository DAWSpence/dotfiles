#init
case $- in
*i*) ;;
*) return ;;
esac

#======================================================================
#display, bash, etc
#======================================================================

case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac


if test -n "$(command -v nvim)"; then

  EDITOR=nvim
  VISUAL=nvim
else

  EDITOR=vim
  VISUAL=vim
fi
export EDITOR VISUAL




#default pager
if test -n "$(command -v less)"; then

  PAGER="less"
  MANPAGER="$PAGER"
else
  PAGER="more"
  MANPAGER="$PAGER"
fi
export PAGER MANPAGER



#display
if [ -z $DISPLAY ]; then
  export DISPLAY="$(tail -1 /etc/resolv.conf | cut -d' ' -f2):0"
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



#======================================================================
#variables, options
#======================================================================
unset MAILCHECK
set -o vi
set -o noclobber

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars


# shell opts. see bash(1) for details
shopt -s extglob                 >/dev/null 2>&1  
shopt -s hostcomplete            >/dev/null 2>&1  
shopt -u mailwarn                >/dev/null 2>&1

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar


#enable posix completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'


if echo ${BASH_VERSION%%[0-9.]*} > 4; then
  PROMPT_DIRTRIM=2
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



#======================================================================
#shell prompt
#======================================================================


PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1='\[\033[0;32m\]\u\[\033[00m\]@\[\033[0;36m\]\h\[\033[00m\]:\[\033[00m\]\w${PS1_CMD1} '
printf '\e[?12;25h'
printf '\e[2 q'





#======================================================================
#paths and whatnot
#======================================================================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export BASH_CONFIG_DIR="$XDG_CONFIG_HOME/bash"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export HOSTFILE=~/.ssh/known_hosts
export LOGNAME=$(id -un)



HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '




paths=(
  $PATH
  $HOME/bin
  $HOME/.local/bin
  $XDG_CONFIG_HOME
  $XDG_DATA_HOME
  $XDG_CACHE_HOME
  $XDG_STATE_HOME
  /usr/sbin
  /usr/local/sbin
)

for paths in "${paths[@]}":; do
  PATH="$PATH:$paths"
done

export PATH



#======================================================================
#sourcing 
#======================================================================
#note: use sheldon

eval "$(sheldon --quiet source)"

#scripts
source $BASH_CONFIG_DIR/scripts/shellconf.sh
source $BASH_CONFIG_DIR/scripts/functions.sh
source $BASH_CONFIG_DIR/scripts/git-prompt.sh

#addtional sources
source $XDG_CONFIG_HOME/tmux/tmux.conf

#aliases
source $BASH_CONFIG_DIR/aliases/system.sh
source $BASH_CONFIG_DIR/aliases/docker.sh
source $BASH_CONFIG_DIR/aliases/nvim.sh
