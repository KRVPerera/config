#!/bin/bash

source /Users/rukshanp/bash_functions.sh

print_all_arguments $@

FILE=$(find_ballerina_file $2)

if [ ! -f "$FILE" ]; then
    echo "A file named $FILE does not exists"
    exit 1
fi

echo "Running ballerina tool on : $FILE"

tool_command="run"
if [[ ! -z $1 ]]; then
    echo "missing argument assume this is ballerina 'run'"
else
    tool_command="$1"
fi

echo

echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo
echo "$BALLERINA_TOOL $tool_command --experimental $FILE"

if [[ tool_command == "build" ]]; then
    echo "Building $FILE using ballerina"
elif [[ tool_command == "run" ]]; then
    echo "Running $FILE using ballerina"
fi
$BALLERINA_TOOL $tool_command --experimental $FILE

