#!/bin/bash

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
./gradlew build -x createJavadoc -x generateDocs -x npmBuild -x :ballerina-http:test -x :composer-library:test $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    exit 1
fi
if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Ballerina Build SUCCESSFUL"'
fi
git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
sleep 1
