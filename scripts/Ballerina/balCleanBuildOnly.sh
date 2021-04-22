#!/bin/bash
if [[ -z $1 ]]; then
    echo "./gradlew clean --no-build-cache"
    ./gradlew clean --no-build-cache 
else
    echo "./gradlew clean --no-build-cache --refresh-dependencies"
    ./gradlew clean --no-build-cache --refresh-dependencies
fi

cleanbuildStatus=$?

if [[ $cleanbuildStatus -ne 0 ]]; then
    osascript -e 'display notification "clean FAILED" with title "CLEAN FAILED" subtitle "clean ballerina"'

    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina gradle clean FAILED"'
    fi
    git restore '*.toml'
    exit 1
fi

if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Ballerina gradle Clean SUCCESSFUL"'
fi

./gradlew build -x createJavadoc -x check -x test -x generateDocs --rerun-tasks
buildStatus=$?
echo "Build status : $buildStatus"
if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
    if [[ $SILENT == "1" ]]; then
        osascript -e 'say "Ballerina build FAILED"'
    fi
    git restore '*.toml'
    exit 1
fi

if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Build SUCCESSFUL"'
fi
git restore '*.toml'
