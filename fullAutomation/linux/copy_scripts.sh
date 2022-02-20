#!/usr/bin/env bash


echo "Copying zshrc"
configPath=~/MyConfig/config
mkdir ~/MyScripts

ln -s $configPath/scripts/Ballerina/* ~/MyScripts
ln -s $configPath/scripts/media/* ~/MyScripts
ln -s $configPath/scripts/linux/* ~/MyScripts
