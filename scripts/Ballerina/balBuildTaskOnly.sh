#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi


echo "./gradlew "$@" --rerun-tasks"
./gradlew "$@" --rerun-tasks
notify-send -u normal -h int:value:42 "Ballerina build test finished ..."
