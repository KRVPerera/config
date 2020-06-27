#!/bin/bash

if [[ ! -f /usr/bin/git ]]; then
    sudo apt install git
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

# Oh my zsh
zshInstall=`grep /zsh$ /etc/shells | tail -1`
if [[ -z $zshInstall ]]; then
    sudo apt install zsh
    sudo apt install curl
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo ""
    echo "##############################################"
    echo "####    zsh is already installed          ####"
    echo "##############################################"
fi

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

sudo apt autoremove

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

echo "Copying zshrc"
mv ~/.zshrc ~/.zshrc.bak
ln -s $configPath/zshrc ~/.zshrc

echo "Copying aliases"
mv ~/bash_aliases.sh ~/bash_aliases.bak
ln -s $configPath/bash_aliases.sh ~/bash_aliases.sh

echo "Copying bashrc"
mv ~/.bashrc ~/.bashrc.bak
ln -s $configPath/bashrc ~/.bashrc

## vim setup
if [[ ! -f /usr/bin/vim ]] ; then
    echo "Installing vim"
    sudo apt install vim
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
