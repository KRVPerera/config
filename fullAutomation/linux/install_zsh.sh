#!/usr/bin/env bash

configPath=~/MyConfig/config
zshInstall=`grep /zsh$ /etc/shells | tail -1`
if [[ -z $zshInstall ]]; then
    sudo apt install zsh
    sudo apt install curl
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo ""
    echo "##############################################"
    echo "####    zsh is already installed          ####"
    echo "##############################################"
fi

echo "Copying zshrc"
mv ~/.zshrc ~/.zshrc.bak
ln -s $configPath/zshrc.linux ~/.zshrc
export ZPLUG_HOME=$HOME/.zplug
mkdir $ZPLUG_HOME
git clone https://github.com/zplug/zplug $ZPLUG_HOME

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > $HOME/.zsh/plugins/bd/bd.zsh
