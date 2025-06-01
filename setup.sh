#use this setup for some time until you have time to setup your own config with nix package manager

#print a small warning message


#===============================================
echo ("This dotfile setup requires stow")
echo
sleep 1

#===============================================
echo ("setting up xdg dirs...")
echo
sleep 1


if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME=$HOME/.config
fi

if [[ ! -d "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME=$HOME/.cache
fi

if [[ ! -d "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME=$HOME/.local/state
fi

if [[ ! -d "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME=$HOME/.local/data
fi

if [[ ! -d "$XDG_DATA_DIRS" ]]; then

  export XDG_DATA_DIRS=/usr/local/share
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share

fi


if [[ ! -d "$XDG_CONFIG_DIRS" ]]; then
  export XDG_CONFIG_DIRS=/etc/xdg
fi


#===============================================

#setup with stow

#nvim
stow -v -d ./nvim -t $XDG_CONFIG_HOME -S .

stow -v -d ./zsh/ -t $HOME -S .



