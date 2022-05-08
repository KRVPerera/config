#!/bin/bash
sudo apt update
if [[ ! -f /usr/bin/git ]]; then
    sudo apt install git git-gui gitk gitweb
else
    echo ""
    echo "##############################################"
    echo "####    git is already installed          ####"
    git --version
    echo "##############################################"
fi

## git setup
git config --global user.name "KRVPerera"
git config --global user.email "rukshan.viduranga@gmail.com"
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
sudo apt install -y htop pydf

sudo apt install -y curl xterm dmenu pcmanfm

# sudo apt install vbetool
## sudo vbetool dpms off

## terminal
sudo apt install terminator

## dev tools
sudo apt install git-extras

## GUI
sudo apt install libgl1-mesa-dev
sudo apt install arandr

# Oh my zsh

## Java installation
if [[ ! -f /usr/bin/java ]] ; then
    sudo apt-get install openjdk-14-jdk
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
    sudo apt install -y vim
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

sudo apt install -y clang --install-suggests
sudo apt install -y g++ --install-suggests
sudo apt install -y openssl

### tiling window mgr
sudo apt install -y neofetch
sudo apt install -y w3m-img
sudo apt install -y imagemagick
sudo apt install -y ranger
sudo apt install -y rofi
sudo apt install -y thunar

### These are for vim YCM plugin
sudo apt install build-essential cmake python3-dev
sudo apt install mono-complete golang nodejs default-jdk npm
# install QT Desktop
# install vscode

source kitty.sh
source term.sh

## npm is needed for web assembly rust
source install_npm.sh
sudo apt autoremove

curl -sLf https://spacevim.org/install.sh | bash
