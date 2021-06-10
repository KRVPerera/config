#!/usr/bin/env bash

source /Users/rukshanp/bash_functions.sh

red="\033[31;40m"
blue="\033[34;40m"
green="\033[32;40m"
none="\033[0m"
yellowB="\033[30;43m"

declare -i HELP=0
declare -i JAVA_DEBUG=0
declare -i DEBUG_MODE=0
declare -i MODULE_MODE=0
while getopts mjdhrbf:p: option; do
    case $option in
        d) DEBUG_MODE=1;;
        h) HELP=1 ;;
        f) file=$OPTARG ;;
        r) tool_command="run" ;;
        b) tool_command="build" ;;
        j) JAVA_DEBUG=1 ;;
        m) MODULE_MODE=1 ;;
        p) port=$OPTARG ;;
        ?) echo "Invalid option for $0 $OPTARG" ;;
        *) echo "Invalid argument $OPTARG" ;;
    esac
done

if [[ $DEBUG_MODE == 1 ]]; then
    debugVar="-d"
fi

if [[ ! -z $file ]]; then
    print_all_arguments "$file" $debugVar

    FILE=$(find_ballerina_file "$file" $debugVar)
fi

if [[ $MODULE_MODE == 0 && ! -f "$FILE" ]]; then
    exit 1
fi

if [[ $MODULE_MODE == 0 ]]; then
    echo -e $green"Running ballerina tool on : $FILE"$none
else
    echo -e $green"Running ballerina tool on project mode"$none
fi

if [[ -z $tool_command ]]; then
    echo $red"missing argument assume this is ballerina 'run'"$none
    tool_command="run"
fi

echo

echo -e "\033[30;43m--------------------------------"$none
echo -e $yellowB"Tool path : $BALLERINA_TOOL\t\t"
$BALLERINA_TOOL -v
$BALLERINA_TOOL home
echo -e $yellowB"--------------------------------\t\t"$none
echo -e $yellowB"bal $tool_command $FILE\t\t"$none
echo -e $yellowB"--------------------------------\t\t"$none

if [[ MODULE_MODE == 0 ]]; then
    if [[ $tool_command == "build" ]]; then
        echo "Building $FILE using ballerina"
    elif [[ $tool_command == "run" ]]; then
        echo "Running $FILE using ballerina"
    fi
else
    if [[ $tool_command == "build" ]]; then
        echo -e $blue"Building using ballerina"$none
    elif [[ $tool_command == "run" ]]; then
        echo -e $blue"Running using ballerina"$none
    fi
fi

if [[ -z $port ]]; then
    PORT="5005"
else
    PORT=$port
fi

if [[ $JAVA_DEBUG == 1 ]]; then
    echo -e $green"Running ballerina in debug mode on port $PORT"$none
fi

FINAL_COMMAND=("$BALLERINA_TOOL" "$tool_command")


if [[ $MODULE_MODE == 1 ]]; then
    if [ $JAVA_DEBUG == 1 ]; then
        eval "BAL_JAVA_DEBUG=$PORT ${FINAL_COMMAND[@]}"
    else
        eval "${FINAL_COMMAND[@]}"
    fi
else
    if [ $JAVA_DEBUG == 1 ]; then
        eval "BAL_JAVA_DEBUG=$PORT ${FINAL_COMMAND[@]}"
    else
        ${FINAL_COMMAND[@]} $FILE
    fi
fi

balStatus=$?
if [[ $DEBUG_MODE == 1 && "$balStatus" -ne "0" ]]; then
    echo -e "\n"$red"FAILED \a"$none
    osascript -e 'say "FAILED"'
fi

