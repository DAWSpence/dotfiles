echo "Setting up XDG directories"
sleep 1

if [ ! -d $HOME/$XDG_CONFIG_HOME ]; then
    mkdir -v $HOME/.config


elif [ ! -d $HOME/$XDG_CACHE_HOME ]; then
    mkdir -v $HOME/.cache


elif [ ! -d $HOME/$XDG_DATA_HOME ]; then
    mkdir -v -p $HOME/.local/share


elif [! -d $HOME/$XDG_STATE_HOME ]; then
    mkdir -v $HOME/$XDG_DATA_HOME/state
fi

echo "Setting up shell"
sleep 1

#===========================================================================
mkdir -vp $HOME/.zsh/completions $HOME/.zsh/terminal $HOME/.zsh/themes $HOME/.zsh

git clone https://github.com/marlonrichert/zsh-autosuggestions.git 
cp -v zsh-autosuggestions $HOME/.zsh/completions

git clone https://github.com/Tarrasch/zsh-bd.git 
cp -v zsh-bd $HOME/.zsh/completions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
cp -v zsh-syntax-highlighting $HOME/.zsh/terminal

git clone https://github.com/jeffreytse/zsh-vi-mode.git 
cp -v zsh-vi-mode $HOME/.zsh/terminal

git clone https://github.com/sindresorhus/pure.git 
cp -v pure $HOME/.zsh/themes




echo "Moving files to correct areas"
sleep 1

#===========================================================================
cp -v .zshenv $HOME/
cp -v .zprofile $HOME/.zsh
cp -v .zshrc $HOME/.zsh
