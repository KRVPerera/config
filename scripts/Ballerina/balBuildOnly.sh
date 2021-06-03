#!/usr/bin/env bash

declare -i DEBUG=0
while getopts d option; do
    case $option in
    d) DEBUG=1 ;;
    ?) echo "Invalid option for $0 $OPTARG ";;
    *) echo "Invalid argument $OPTARG";;
    esac
done

allOptions=$*
restOfOptions=${allOptions//-d/}

osascript -e 'display notification "Ballerina build started" with title "Build started" subtitle "Build Ballerina"'
echo "./gradlew build -x createJavadoc -x check -x test -x generateDocs $restOfOptions"

./gradlew build -x createJavadoc -x check -x test -x generateDocs "$restOfOptions"
buildStatus=$?

if [[ $buildStatus -ne 0 ]]; then
    [[ $DEBUG == 1 ]] && osascript -e 'say "Ballerina build FAILED"'
    git restore '*.toml'
    exit 1
fi

if [[ $DEBUG == "1" ]]; then
    osascript -e 'say "Congratulations Ballerina Build without test SUCCESSFUL"'
fi

git restore '*.toml'
sleep 1