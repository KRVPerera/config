#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    osascript -e 'say "No arguments provided"'
    exit 1
fi

if [[ $SILENT == "1" ]]; then
    ./gradlew "$@" -x createJavadoc -x check -x generateDocs -x npmBuild 
fi
osascript -e 'say "Build task finished"'
