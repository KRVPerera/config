#!/bin/bash
./gradlew build -x :jballerina-integration-test:test -x :plugin-vscode:test -x createBalo -x createJavadoc -x check -x test -x generateDocs -x npmBuild -x createBir -x :ballerina-rt:jar
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    exit 1
fi
osascript -e 'say "Ballerina Build SUCCESSFUL"'
sleep 1
