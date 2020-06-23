#!/bin/bash
osascript -e 'display notification "Source2 build started"' with title "syncSrc2.sh cronjob"
osascript -e 'say "Source2 build started"'

cd /Users/rukshanp/Projects/Ballerina/ballerina-lang
git checkout master
git pull up master
git push
./gradlew clean build -x createJavadoc -x check -x test -x generateDocs -x npmBuild

osascript -e 'display notification "Source2 build finished"' with title "syncSrc2.sh cronjob"
osascript -e 'say "Source2 build finished"'
