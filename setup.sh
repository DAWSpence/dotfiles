#VARIABLES
#===============================================


export GITHUB_USERNAME=DAWSpence


export REPO_NAME=dotfiles


#===============================================
















mkdir $HOME/.chezmoi
#export TEMP=$(pwd)
#===============================================
echo "Sourcing the new .profile file"
sleep(1)
#echo "export REPO_PATH = $TEMP" >> .profile
#cat .profile_additons >> .profile
mv -vu ./.profile $HOME/.profile



#===============================================
echo "Sourcing the new .profile file"
sleep(1)
source $HOME./.profile


#===============================================
echo "Installing and running chezmoi dotfiles manager and using github, this step will need to change if you use a different manager or version control."
sleep(2)

echo "Current github username: $GITHUB_USERNAME"
echo "Current repo name: $REPO_NAME"


#===============================================
echo "Installing and running chezmoi dotfiles manager, this step will need to change if you use a different one."
echo ""
sleep(2)

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.chezmoi

echo "Running chezmoi:"
echo ""
sleep(2)

chezmoi init --apply --verbose https://github.com/$GITHUB_USERNAME/$REPO_NAME.git





