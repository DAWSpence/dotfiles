#!/usr/bin/env sh
#some systems have bashrc already with stuff, this allows for preservation of preexisting content

if [[ ! -f ~/.bashrc ]]; then
  touch ~/.bashrc
  echo 'source $XDG_CONFIG_HOME/bash/init/init.sh' > ~/.bashrc

else
  echo 'source $XDG_CONFIG_HOME/bash/init/init.sh' | cat - .bashrc > .temp && mv .temp .bashrc

fi
