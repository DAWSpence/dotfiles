# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


if [ ! -d $HOME/$XDG_CONFIG_HOME ]; then
    mkdir -v $HOME/.config



elif [ ! -d $HOME/$XDG_CACHE_HOME ]; then
    mkdir -v $HOME/.cache



elif [ ! -d $HOME/$XDG_DATA_HOME ]; then
    mkdir -v -p $HOME/.local/share



elif [! -d $HOME/$XDG_STATE_HOME ]; then
    mkdir -v $HOME/$XDG_DATA_HOME/state

fi


if [ -d "$HOME/.chezmoi/chezmoi" ] ; then
    PATH="$HOME/.chezmoi/chezmoi:$PATH"
fi




#export EDITOR='vim'
#export TERM=xterm-256color


