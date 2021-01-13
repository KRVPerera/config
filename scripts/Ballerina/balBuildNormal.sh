#!/bin/bash

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
./gradlew build -x createJavadoc -x generateDocs $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    git restore '*.toml'
    exit 1
fi
if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Ballerina Build SUCCESSFUL"'
fi
git restore '*.toml'
sleep 1
