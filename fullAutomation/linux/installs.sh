#!/bin/bash

sudo apt update
sudo apt install nala
sudo nala update
if [[ ! -f /usr/bin/git ]]; then
    sudo nala install git git-gui gitk gitweb
else
    echo ""
    echo "##############################################"
    echo "####    git is already installed          ####"
    git --version
    echo "##############################################"
fi

## git setup
git config --global user.name "KRVPerera"
git config --global user.email "2173530+KRVPerera@users.noreply.github.com"
git config --global color.ui auto
git config --global core.editor "vim --wait"
git config --global merge.conflictstyle diff3
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
# git config --global difftool.prompt false # I disabled because have experience with 100s of vims opening at once

## utils
### monitoring tools
sudo nala install -y htop pydf

sudo nala install -y curl xterm dmenu pcmanfm

# sudo nala install vbetool
## sudo vbetool dpms off

## terminal
sudo nala install terminator

## dev tools
sudo nala install git-extras

## GUI
sudo nala install libgl1-mesa-dev
sudo nala install arandr

# Oh my zsh

## Java installation
if [[ ! -f /usr/bin/java ]] ; then
    sudo nala-get install openjdk-14-jdk
else
    echo ""
    echo "##############################################"
    echo "####   java is already installed          ####"
    java -version
    echo "##############################################"
fi

configPath=~/MyConfig/config
cd ~
if [[ ! -d MyConfig ]]; then
    mkdir MyConfig
    cd MyConfig
    git clone https://github.com/KRVPerera/config.git
    cd ..
fi

cd $configPath
git pull origin master

echo "Copying aliases"
mv ~/bash_aliases.sh ~/bash_aliases.bak
ln -s $configPath/bash_aliases.sh ~/bash_aliases.sh
ln -s $configPath/aliases/local_aliases.sh ~/local_aliases.sh

echo "Copying bashrc"
mv ~/.bashrc ~/.bashrc.bak
ln -s $configPath/bashrc ~/.bashrc

echo "Copying terminator config"
mv ~/.config/terminator/config ~/.config/terminator/config
ln -s $configPath/terminator/config ~/.config/terminator/config

## vim setup
if [[ ! -f /usr/bin/vim ]] ; then
    echo "Installing vim"
    sudo nala install -y vim
    echo "[VIM] install vim plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "[VIM] install vim solarized8"
    git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8

    echo "Copying vimrc"
    mv ~/.vimrc ~/.vimrc.bak
    ln -s $configPath/vimrc ~/.vimrc
else
    echo ""
    echo "##############################################"
    echo "####   vim is already installed          ####"
    vim --version
    echo "##############################################"
fi

sudo nala install -y clang --install-suggests
sudo nala install -y g++ --install-suggests
sudo nala install -y openssl

### tiling window mgr
sudo nala install -y cowsay fortune-mod rofi thunar ranger imagemagick w3m-img neofetch

### These are for vim YCM plugin
sudo nala install build-essential cmake python3-dev
sudo nala install mono-complete golang nodejs default-jdk npm
# install QT Desktop
# install vscode
sudo nala install slurp
sudo nala install grim

source kitty.sh
source term.sh

## npm is needed for web assembly rust
source install_npm.sh
sudo nala autoremove

curl -sLf https://spacevim.org/install.sh | bash
