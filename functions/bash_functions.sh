#!/usr/bin/env bash

bra() {
    bh
    find . -type f -name "*.bal" -print -exec bash -c '
    ret=0
    for file do
        echo ""
        echo -e "----------------------- RUN $file ---------------"
        echo ""
        eval "$BALLERINA_TOOL" run "$file" || ret=$?
        echo ""
        echo "----------------------- FINISHED $file ---------"
        echo ""
        echo ""
        echo ""
    done
    exit "$ret"' bash {} \;
}

find_ballerina_file() {
    # echo -e "\033[0m"
    FILE=$1
    debug_on=false

    if [[ $2 == "-d" ]]; then
        debug_on=true
    fi

    if [ -f "$FILE" ]; then
        echo $FILE
        return 0
    fi

    if [[ $debug_on == true ]]; then
        echo "$FILE not found assuming a ballering file" >/dev/stderr
    fi

    LAST_CHAR="${FILE: -1}"
    if [[ $LAST_CHAR == "." ]]; then
        FILE=${FILE}bal
        if [[ $debug_on == true ]]; then
            echo "Extention is not given. Assuming '.bal' : $FILE" >/dev/stderr
        fi
    fi

    if [ "${#FILE}" -le 5 ]; then
        if [[ $debug_on == true ]]; then
            echo "File is shorter to have a '.bal' extention : $FILE" >/dev/stderr
        fi
        FILE=${FILE}.bal
    fi

    FILE_EXT="${FILE: -4}"
    if [[ ! $FILE_EXT == ".bal" ]]; then
        FILE=${FILE}.bal
        if [[ $debug_on == true ]]; then
            echo "File is not a ballerina file : $FILE" >/dev/stderr
        fi
    fi

    if [[ -f "$FILE" ]]; then
        echo "$FILE"
        return 0
    else
        echo -e "\033[31mA file named '"$FILE"' does not exists\033[0m" >/dev/stderr
        return 1
    fi
}

print_all_arguments() {
    DEBUG=$2
    if [[ $DEBUG == "-d" ]]; then
        declare -i idx=0
        for arg in "$@"; do
            echo "argument $idx : $arg"
            ((idx += 1))
        done
    fi
}

restore_unwanted_files() {
    echo -e "\n\033[32mgit restore '*.toml'\033[0m"
    git restore '*.toml'
}

vim_help() {
    echo "ssh -L 6666:localhost:6666 ip.of.other.machine nvim --headless --listen localhost:6666"
}


get_machine() {

    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     
            machine=Linux;;
        Darwin*)    
            machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac

    echo ${machine}
}
