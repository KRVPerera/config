#!/bin/bash
if [[ $DEBUG == "1" ]]; then
    echo "Loading functions : $0"
fi 

find_ballerina_file () {
    FILE=$1
    debug_on=false

    if [[ $2 == "debug" ]]; then
        debug_on=true
    fi

    if [ -f "$FILE" ]; then
        echo $FILE
        return 0
    fi

    if [[ $debug_on == true ]]; then
        echo "$FILE not found assuming a ballering file"
    fi

    LAST_CHAR="${FILE: -1}"
    if [[ $LAST_CHAR == "." ]]; then
        FILE=${FILE}bal
        if [[ $debug_on == true ]]; then
            echo "Extention is not given. Assuming '.bal' : $FILE"
        fi
    fi

    if [ "${#FILE}" -le 5 ]; then
        FILE=${FILE}.bal
        if [[ $debug_on == true ]]; then
            echo "File is shorter to have an extention : $FILE"
        fi
    fi

    FILE_EXT="${FILE: -4}"
    if [[ ! $FILE_EXT == ".bal" ]]; then
        FILE=${FILE}.bal
        if [[ $debug_on == true ]]; then
            echo "File is not a ballerina file : $FILE"
        fi
    fi

    if [[ $debug_on == true ]]; then
        echo "Final name : $FILE"
    fi

    if [[ -f "$FILE" ]]; then
        echo $FILE
        return 0 
    else
        if [[ $debug_on == true ]]; then
            echo "Final name : $FILE"
        fi
        return 1
    fi
}

print_all_arguments () {
    # store arguments in a special array
    args=("$@")
    # get number of elements
    ELEMENTS=${#args[@]}

    # echo each element in array
    # for loop
    for (( i=0;i<$ELEMENTS;i++)); do
        echo "$i : ${args[${i}]}"
    done
}
