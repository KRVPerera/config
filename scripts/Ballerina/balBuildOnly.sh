#!/bin/bash

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    exit 1
fi
osascript -e 'say "Ballerina Build SUCCESSFUL"'
sleep 1
