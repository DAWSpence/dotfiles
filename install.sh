#!/bin/sh
# Credits: twpayne (author of chezmoi), Vantesh

set -e # -e: exit on error

#setups
GITHUB_NAME="DAWSpence"
bin_dir="$HOME/.local/bin"
chezmoi="$bin_dir/chezmoi"

#check if not in path
case :$PATH: in
  *:$bin_dir:*)
    ;;
  *)
    export PATH="$PATH:$chezmoi"
esac

sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
sh -c $chezmoi -- init --branch main --apply $GITHUB_NAME 



# if [ ! "$(command -v chezmoi)" ]; then
  #
  #
  # if [ "$(command -v curl)" ]; then
  #   sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  #
  # elif [ "$(command -v wget)" ]; then
  #   sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  #
  # else
  #   echo "To install chezmoi, you must have curl or wget installed." >&2
  #   exit 1
  #
  # fi
  #
# else
  # chezmoi=chezmoi

# fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
# script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init

#add to path

# exec "$chezmoi" init --apply "--source=$script_dir"

