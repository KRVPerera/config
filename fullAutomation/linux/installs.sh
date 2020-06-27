#!/bin/bash

sudo apt install vim
sudo apt install git

## git setup
git config --global user.name "KRVPerera"
git config --global user.email "rukshan.viduranga@gmail.com"
git config --global color.ui auto
git config --global core.editor "vim --wait"
git config --global merge.conflictstyle diff3
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'


# Oh my zsh
sudo apt install zsh
sudo apt install curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~
mkdir MyConfig
cd MyConfig
git clone https://github.com/KRVPerera/config.git
cd config
cp zshrc ~/.zshrc
cp bash_aliases.sh ~/bash_aliases.sh
