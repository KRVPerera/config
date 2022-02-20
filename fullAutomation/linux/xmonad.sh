#!/usr/bin/env bash
## some are duplicated here but it is okay
sudo apt install -y xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev 
libghc-xmonad-contrib-doc 
sudo apt install -y dmenu xterm ranger thunar nitrogen compton
sudo apt install -y xmobar

## For development
# mkdir ~/.config/xmonad
#cd ~/.config/xmonad
#  curl -sSL https://get.haskellstack.org/ | sh
#sudo apt install haskell-stack
#cd xmonad
#git fetch --tags
#git checkout tags/v0.17.0 -b latest
#cd xmonad-contrib
#git fetch --tags
#git checkout tags/v0.17.0 -b latest
#cd ~/.config/xmonad
#git clone https://github.com/xmonad/xmonad
#git clone https://github.com/xmonad/xmonad-contrib
#stack upgrade
#stack init
#stack install
