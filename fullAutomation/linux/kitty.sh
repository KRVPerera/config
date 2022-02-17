#!/usr/bin/env bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
export PATH=$PATH:~/.local/kitty.app/bin
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
configPath=~/MyConfig/config

echo "Copying kitty config"
ln -s $configPath/kitty/kitty.conf ~/.config/kitty/
