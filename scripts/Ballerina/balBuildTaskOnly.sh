#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    osascript -e 'say "No arguments provided"'
    exit 1
fi


echo "./gradlew "$@" --rerun-tasks"
./gradlew "$@" --rerun-tasks
if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Build task finished"'
fi
