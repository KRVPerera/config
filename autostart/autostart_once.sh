#!/usr/bin/env zsh
/usr/bin/emacs --daemon &
/usr/bin/nitrogen --restore &
nm-applet &
volumeicon &
picom --experimental-backend &
notify-log $HOME/.log/notify.log &
