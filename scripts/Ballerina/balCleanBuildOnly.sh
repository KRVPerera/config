#!/bin/bash
./gradlew clean
cleanbuildStatus=$?

if [[ $cleanbuildStatus -ne 0 ]]; then
    osascript -e 'display notification "clean FAILED" with title "CLEAN FAILED" subtitle "clean ballerina"'

    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina gradle clean FAILED"'
    fi

    exit 1
fi

if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Ballerina gradle Clean SUCCESSFUL"'
fi

./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild

buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina build FAILED"'
    fi
    exit 1
fi

if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Build SUCCESSFUL"'
fi
