#!/bin/bash
./gradlew clean
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "clean FAILED" with title "CLEAN FAILED" subtitle "clean ballerina"'
    osascript -e 'say "Ballerina gradle clean FAILED"'
    exit 1
fi
osascript -e 'say "Ballerina gradle Clean SUCCESSFUL"'
./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    exit 1
fi
osascript -e 'say "Build SUCCESSFUL"'
