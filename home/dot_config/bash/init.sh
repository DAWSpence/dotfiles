#init
case $- in
*i*) ;;
*) return ;;
esac

unset MAILCHECK
set -o vi

#paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export BASH_CONFIG_DIR="$XDG_CONFIG_HOME/bash"

case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

#default editor
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

paths=(
  $path
  $HOME/bin
  $HOME/.local/bin
  $XDG_CONFIG_HOME
  $XDG_DATA_HOME
  $XDG_CACHE_HOME
  $XDG_STATE_HOME
)

for paths in "${paths[@]}":; do
  PATH="$PATH:$paths"
done

export PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] && ! echo "$PATH" | grep "$HOME/bin" >/dev/null; then
  export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] && ! echo "$PATH" | grep "$HOME/.local/bin" >/dev/null; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d /usr/sbin ] && ! echo "$PATH" | grep "/usr/sbin" >/dev/null; then
  export PATH="$PATH:/usr/sbin"
fi

if [ -d /usr/local/sbin ] && ! echo "$PATH" | grep "/usr/local/sbin" >/dev/null; then
  export PATH="$PATH:/usr/local/sbin"
fi

#shell prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1='\[\033[0;32m\]\u\[\033[00m\]@\[\033[0;36m\]\h\[\033[00m\]:\[\033[00m\]\w${PS1_CMD1} '
printf '\e[?12;25h'
printf '\e[2 q'

#scripts
source $BASH_CONFIG_DIR/scripts/shellconf.sh
source $BASH_CONFIG_DIR/scripts/functions.sh
source $BASH_CONFIG_DIR/scripts/git-prompt.sh

#aliases
source $BASH_CONFIG_DIR/aliases/system.sh
source $BASH_CONFIG_DIR/aliases/docker.sh
source $BASH_CONFIG_DIR/aliases/nvim.sh
