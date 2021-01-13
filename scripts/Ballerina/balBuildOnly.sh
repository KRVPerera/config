#!/bin/bash

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
echo "./gradlew build -x createJavadoc -x check -x test -x generateDocs $@"
./gradlew build -x createJavadoc -x check -x test -x generateDocs $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina build FAILED"'
    fi
    git restore '*.toml'
    exit 1
fi

if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Congratulations Ballerina Build without test SUCCESSFUL"'
fi

osascript -e 'display notification "Congratulations Ballerina Build without test SUCCESSFUL" with title "BUILD OK" subtitle "Build ballerina without test OK"'
git restore '*.toml'
sleep 1
