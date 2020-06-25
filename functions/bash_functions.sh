#!/bin/bash

echo "Loading functions : $0"

find_ballerina_file () {
    FILE=$1

    if [[ ${FILE:-1} == "." ]]; then
        echo "Extention is not given. Assuming '.bal'"
        FILE=${FILE}bal
    fi

    # TODO: fix this issue :(
    if [ "${#FILE}" -le 4 ]; then
        echo "File does not have a '.bal' extention"
        FILE=${FILE}.bal
        echo $FILE
    fi

    if [ ! ${FILE:-4} == ".bal" ]; then
        echo "File does not have a '.bal' extention"
        FILE=${FILE}.bal
        echo $FILE
    fi

    if [ ! -f "$FILE" ]; then
        echo "A file named '$FILE' does not exists"
        exit 1
    fi
}

greeting () {
  echo "Hello $1"
}

greeting "Joe"
find_ballerina_file "t5"
