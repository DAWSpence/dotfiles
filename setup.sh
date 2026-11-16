cd $HOME

if [ -d "$HOME/.git" ]; then 
  git -C $HOME fetch origin
  git -C $HOME reset --hard "origin/$GITHUB_BRANCH" 

else
  git clone --branch "$GITHUB_BRANCH" --single-branch "$GITHUB_REPO" $HOME/dotfiles
  cd $HOME/dotfiles
  sh $HOME/setup/install.sh

fi


