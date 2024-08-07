#!/usr/bin/env bash
#
cd $HOME/MyConfig/config
pwd

alias cp="cp --update"

git commit -am "[backup] - `date` - "
git push
