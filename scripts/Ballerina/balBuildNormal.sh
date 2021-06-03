#!/usr/bin/env bash

declare -i DEBUG=0
declare -i HELP=0
while getopts dh option; do
    case $option in
    d) DEBUG=1 ;;
    h) HELP=1 ;;
    ?) echo "Invalid option for $0 $OPTARG " ;;
    *) echo "Invalid argument $OPTARG" ;;
    esac
done

red="\033[31;40m"
green="\033[32;40m"
none="\033[0m"

if [[ $HELP == 1 ]]; then
    echo "Use -d to run in debug mode"
    exit 0
fi

if [[ $DEBUG == 1 ]]; then
    # echo -e $greenScript"Script is running in debug mode.$none"
    osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
fi

allOptions=$*
restOfOptions=${allOptions//-d/}

./gradlew build -x createJavadoc -x generateDocs "$restOfOptions"
buildStatus=$?

if [[ $buildStatus -ne 0 ]]; then
    if [[ $DEBUG == 1 ]]; then
        osascript -e 'display notification "build FAILED" with title "BUILD FAILED" subtitle "Build ballerina"'
        osascript -e 'say "Ballerina build FAILED"'
    fi
    restore_unwanted_files
    exit 1
fi

if [[ $DEBUG == 1 ]]; then
    osascript -e 'say "Ballerina Build SUCCESSFUL"'
fi

restore_unwanted_files
sleep 1
