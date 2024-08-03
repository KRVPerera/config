#!/usr/bin/env bash
#
cd $HOME/MyConfig/config
pwd

alias cp="cp --update"

git add .
git status
git diff
git commit -am "[backup] - `date` - "
git push
