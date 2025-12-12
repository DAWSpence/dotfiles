#!/usr/bin/env sh
#create dirs if they dont exist
[ -d "$XDG_CONFIG_HOME" ] || mkdir -p $HOME/.config
[ -d "$XDG_DATA_HOME" ] || mkdir -p $HOME/.local/share
[ -d "$XDG_CACHE_HOME" ] || mkdir -p $HOME/.cache
[ -d "$XDG_STATE_HOME" ] || mkdir -p $HOME/.local/state
[ -d "$HOME/bin" ] || mkdir -p "$HOME/bin"
[ -d "$HOME/.local/bin" ] || mkdir -p "$HOME/.local/bin"
[ -d "$HOME/projects" ] || mkdir -p "$HOME/projects"
[ -d "$HOME/projects/github" ] || mkdir -p "$HOME/projects/github"

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

#setup bashrc

if [[ -f ~/.bashrc ]]; then
  touch ~/.bashrc
  echo 'source $HOME/.config/bash/init.sh' > ~/.bashrc

else
  echo 'source $HOME/.config/bash/init.sh' | cat - ~/.bashrc > ~/.temp && mv ~/.temp ~/.bashrc

fi
