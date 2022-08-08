#!/usr/bin/env bash 

source ~/bash_functions.sh
echo "./gradlew build -x check -x test --configure-on-demand $restOfOptions"

if [[ -z $restOfOptions ]]; then
    echo "Building"
    ./gradlew build -x check -x test --configure-on-demand
else
    ./gradlew build -x check -x test --configure-on-demand "$restOfOptions"
fi
buildStatus=$?

machine=$(get_machine)
echo ${machine}

if [[ "$balStatus" -ne "0" ]]; then
    echo -e "\n"$red"FAILED \a"$none
    if [[ $machine == "Mac" ]]; then
        osascript -e 'display notification "Ballerina Build without test FAILED"'
        [[ $DEBUG == 1 ]] && osascript -e 'say "Ballerina build FAILED"'
    else
        notify-send -u critical -h int:value:42 "Ballerina build FAILED ..."
    fi
fi

if [[ $buildStatus -ne 0 ]]; then
    git restore '*.toml'
    exit 1
fi

if [[ $DEBUG == "1" ]]; then
    if [[ $machine == "Mac" ]]; then
        osascript -e 'say "Congratulations Ballerina Build without test SUCCESSFUL"'
    fi
fi

if [[ $machine == "Mac" ]]; then
    osascript -e 'display notification "Congratulations Ballerina Build without test SUCCESSFUL"'
else
    notify-send -u normal -h int:value:42 "Ballerina build without test SUCCESSFUL ..."
fi

git restore '*.toml'
date
sleep 1
