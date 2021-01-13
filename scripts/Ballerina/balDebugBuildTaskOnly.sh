#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    osascript -e 'say "No arguments provided"'
    exit 1
fi


echo "./gradlew "$@" -x createJavadoc -x check -x generateDocs --rerun-tasks -Dorg.gradle.debug=true --no-daemon --debug-jvm"
#./gradlew "$@" -x createJavadoc -x check -x generateDocs -x npmBuild -x npmBuild -Dorg.gradle.debug=true --no-daemon --debug-jvm
./gradlew "$@" -x createJavadoc -x check -x generateDocs --rerun-tasks --no-daemon --debug-jvm
if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Build task finished"'
fi
