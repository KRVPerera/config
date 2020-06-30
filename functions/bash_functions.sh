#!/bin/bash

echo "Loading functions : $0"

find_ballerina_file () {
    FILE=$1
    FILE_EXT={$1:-4}
    debug_on=false

    if [[ $2 == "debug" ]]; then
        debug_on=true
    fi


    if [ -f "$FILE" ]; then
        echo $FILE
    fi

    if [[ $debug_on == true ]]; then
        echo "$FILE not found assuming a ballering file"
    fi

    if [[ ${FILE:-1} == "." ]]; then
        if [[ $debug_on == true ]]; then
            echo "Extention is not given. Assuming '.bal'"
        fi
        FILE=${FILE}bal
    fi

    # TODO: fix this issue :(
    if [ "${#FILE}" -le 4 ]; then
        if [[ $debug_on == true ]]; then
            echo "File does not have a '.bal' extention"
        fi
        FILE=${FILE}.bal
    fi

    if [[ ! $FILE_EXT == ".bal" ]]; then
        if [[ $debug_on == true ]]; then
            echo "File does not have a '.bal' extention"
        fi
        FILE=${FILE}.bal
    fi

    if [[ $debug_on == true ]]; then
        echo "Found : $FILE"
    fi

    if [[ -f "$FILE" ]]; then
        echo $FILE
    fi
}
