#!/usr/bin/env sh

#some systems have bashrc already with stuff, this allows for preservation of preexisting content
if [[ ! -f ~/.bashrc ]]; then
  touch ~/.bashrc 
  echo '[-n "$PS1"] && source ~/.bash_profile' > ~/.bashrc

else

  touch ~/.bashrc_temp
  cat ~/.bashrc > ~/.bashrc_temp
  echo '' > ~/.bashrc
  echo '[-n "$PS1"] && source ~/.bash_profile' > ~/.bashrc
  cat ~/.bashrc_temp >> ~/.bashrc
  rm ~/.bashrc_temp

fi
