#!/bin/bash

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
echo "./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild $@"
./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
    exit 1
fi
osascript -e 'say "Congratulations Ballerina Build without test SUCCESSFUL"'
git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
sleep 1
