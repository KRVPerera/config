#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    osascript -e 'say "No arguments provided"'
    exit 1
fi

./gradlew "$@" -x createJavadoc -x check -x test -x generateDocs -x npmBuild
osascript -e 'say "Build task finished"'