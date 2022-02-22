#!/usr/bin/env bash 
echo "./gradlew build -x check -x test --configure-on-demand $restOfOptions"

if [[ -z $restOfOptions ]]; then
    echo "Building"
    ./gradlew build -x check -x test --configure-on-demand
else
    ./gradlew build -x check -x test --configure-on-demand "$restOfOptions"
fi
buildStatus=$?

if [[ "$balStatus" -ne "0" ]]; then
    echo -e "\n"$red"FAILED \a"$none
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     
            machine=Linux;
            notify-send -u critical -h int:value:42 "Ballerina build FAILED ...";;
        Darwin*)    
            machine=Mac;
            [[ $DEBUG == 1 ]] && osascript -e 'say "Ballerina build FAILED"';;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo ${machine}
fi

if [[ $buildStatus -ne 0 ]]; then
    git restore '*.toml'
    exit 1
fi

if [[ $DEBUG == "1" ]]; then
    if [[ machine == "Mac" ]]; then
        osascript -e 'say "Congratulations Ballerina Build without test SUCCESSFUL"'
    fi
fi
notify-send -u normal -h int:value:42 "Ballerina build without test SUCCESSFUL ..."

git restore '*.toml'
sleep 1
