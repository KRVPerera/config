#!/bin/bash

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
echo "./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild $@"
./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina build FAILED"'
    fi
    git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
    exit 1
fi

if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Congratulations Ballerina Build without test SUCCESSFUL"'
fi

git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
sleep 1
