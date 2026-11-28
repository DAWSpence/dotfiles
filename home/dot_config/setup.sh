#!/usr/bin/bash

# set -x

#ensure bash config in system
if [ ! -f ~/.bashrc ]; then
  touch ~/.bashrc
  echo 'source $HOME/.config/bash/init.sh' > ~/.bashrc

else
  #clear the source entry so it doesnt stack
  sed -i -E 's#source \$[A-Za-z_][A-Za-z0-9_]*\/[^[:space:]]*##g' .bashrc
  echo 'source $HOME/.config/bash/init.sh' | cat - ~/.bashrc > ~/.temp && mv ~/.temp ~/.bashrc
fi


if [ ! -d $HOME/.config/tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi



#source the bashrc
source ~/.bashrc
