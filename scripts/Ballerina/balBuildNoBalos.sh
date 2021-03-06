#!/bin/bash
./gradlew build -x :jballerina-integration-test:test -x createBalo -x createJavadoc -x check -x test -x generateDocs -x npmBuild -x createBir -x :ballerina-rt:jar $@
buildStatus=$?
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina build FAILED"'
    fi
    exit 1
fi
if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Congratulations Ballerina Build nobalos SUCCESSFUL"'
fi
git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml
sleep 1
