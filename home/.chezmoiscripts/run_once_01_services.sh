#!/usr/bin/env sh

shopt -s nocasematch

echo "
The dotfiles are installed, but the services and dependencies are likely not.
Type Y to build these services and dependencies, otherwise type N to skip this step (both case insensitive):"


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
      echo default
    ;;

  esac
done

shopt -u nocasematch
