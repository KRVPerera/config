#!/bin/bash
./gradlew build -x :jballerina-integration-test:test -x :plugin-vscode:test -x createBalo -x createJavadoc -x check -x test -x generateDocs -x npmBuild -x createBir -x :ballerina-rt:jar $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    osascript -e 'say "Ballerina build FAILED"'
    exit 1
fi
osascript -e 'say "Congratulations Ballerina Build nobalos SUCCESSFUL"'
git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
sleep 1
