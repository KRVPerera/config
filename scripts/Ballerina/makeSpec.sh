#!/bin/bash
cd /Users/rukshanp/Projects/Ballerina/ballerina-spec/
git stash
git stash clear
git checkout master
git pull up master
git push
git checkout krv
git rebase master
git push -f

cd lang
make clean all

buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Ballerina spec build failed" with title "Spec BUILD FAILED" subtitle "Build ballerina spec"'
    osascript -e 'say "Ballerina spec build falied"'
    exit 1
fi

sleep 1
