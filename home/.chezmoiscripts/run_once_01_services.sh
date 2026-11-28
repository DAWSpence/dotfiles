#!/usr/bin/bash

shopt -s nocasematch

echo "
The dotfiles are installed, but the services they use may not.

Y - to build services and install dotfiles, default shell will be zsh.

N - will not build services, will just install dotfiles. Default shell will be bash.

Type (both case insensitive): "


while read -r OPTION; do

  case "$OPTION" in
    "y") 
      sh -c $HOME/.config/nix/install.sh
      break
    ;;

    "n") 
      sh -c $HOME/.config/setup.sh
      break
    ;;

    *) 
      echo "Enter either Y or N (case insensitive)"
    ;;

  esac
done

shopt -u nocasematch
