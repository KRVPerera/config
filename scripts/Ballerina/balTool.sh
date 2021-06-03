#!/usr/bin/env bash

source /Users/rukshanp/bash_functions.sh

red="\033[31;40m"
green="\033[32;40m"
none="\033[0m"
yellowB="\033[30;43m"

declare -i HELP=0
while getopts dhrbf: option; do
    case $option in
    d) debugVar="-d" ;;
    h) HELP=1 ;;
    f) file=$OPTARG ;;
    r) tool_command="run" ;;
    b) tool_command="build" ;;
    ?) echo "Invalid option for $0 $OPTARG" ;;
    *) echo "Invalid argument $OPTARG" ;;
    esac
done

print_all_arguments "$file" $debugVar

FILE=$(find_ballerina_file "$file" $debugVar)

if [ ! -f "$FILE" ]; then
    exit 1
fi

echo -e $green"Running ballerina tool on : $FILE"$none

if [[ -z $tool_command ]]; then
    echo $red"missing argument assume this is ballerina 'run'"$none
    tool_command="run"
fi

echo

echo -e "\033[30;43m--------------------------------"$none
echo -e $yellowB"Tool path : $BALLERINA_TOOL\t\t"
$BALLERINA_TOOL -v
$BALLERINA_TOOL home
echo -e $yellowB"--------------------------------"$none
echo -e $yellowB"bal $tool_command $FILE\t\t"$none
echo -e $yellowB"--------------------------------"$none"\n"


if [[ $tool_command == "build" ]]; then
    echo "Building $FILE using ballerina"
elif [[ $tool_command == "run" ]]; then
    echo "Running $FILE using ballerina"
fi

$BALLERINA_TOOL $tool_command "$FILE"
