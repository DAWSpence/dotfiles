#!/usr/bin/env sh

#ensure bash config in system
if [ ! -f ~/.bashrc ]; then
  touch ~/.bashrc
  echo 'source $HOME/.config/bash/init.sh' > ~/.bashrc

else
  echo 'source $HOME/.config/bash/init.sh' | cat - ~/.bashrc > ~/.temp && mv ~/.temp ~/.bashrc

fi


#tmux plugin manager install
if [ ! -d $HOME/.config/tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi



#source the bashrc
source ~/.bashrc
