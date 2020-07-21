#!/bin/bash
osascript -e 'display notification "Source2 build started" with title "syncSrc2.sh cronjob" subtitle "Build Ballerina"'
osascript -e 'say "Source2 build started"'

cd /Users/rukshanp/Projects/Ballerina/ballerina-lang
git stash
git stash clear
git checkout master
git pull up master
git push
./gradlew clean build --no-build-cache -x createJavadoc -x check -x test -x generateDocs -x npmBuild

buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Source2 build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Source2 build FAILED"'
    exit 1
fi

osascript -e 'display notification "Source2 build finished" with title "syncSrc2.sh cronjob" subtitle "Build Ballerina"'
osascript -e 'say "Source2 build PASSED"'
sleep 1
