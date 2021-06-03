#!/usr/bin/env bash

if [[ $DEBUG == "1" ]]; then
    echo "Loading functions : $0"
fi

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
