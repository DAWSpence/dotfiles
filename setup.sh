NAME=shell-setup

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

cp -v ./.zshenv $HOME/
cp -v ./.zhistory $HOME/.config
cp -v ./.zlogin $HOME/.config
cp -v ./.zlogout $HOME/.config
cp -v ./.zprofile $HOME/.config
cp -v ./.zshrc $HOME/.config

echo "Deleting repo..."
sleep 1
rm -rfv ../$NAME/
