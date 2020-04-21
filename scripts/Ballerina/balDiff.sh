#!/bin/bash
source ~/bash_aliases
echo "Extracting $1"
FILE=$1

if [ ${FILE: -1} == "." ]; then
    echo "Extention is not given. Assuming '.bal'"
    FILE=${FILE}bal
fi

if [ ! ${FILE: -4} == ".bal" ]; then
    echo "File does not have a '.bal' extention"
    FILE=${FILE}.bal
    echo $FILE
fi

if [ ! -f "$FILE" ]; then
    echo "A file named '$FILE' does not exists"
    exit 1
fi

echo "Creating build file using ballerina"
export BALLERINA_TOOL="/Library/Ballerina/bin/ballerina"; echo "BALLERINA_TOOL=$BALLERINA_TOOL";which ballerina
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo "$BALLERINA_TOOL run --experimental $FILE"
$BALLERINA_TOOL run --experimental $FILE | tee out_lib
filename="${FILE%.*}"

export BALLERINA_TOOL="$HOME/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-1.3.0-SNAPSHOT/bin/ballerina"; echo "BALLERINA_TOOL=$BALLERINA_TOOL";which ballerina
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo "$BALLERINA_TOOL run --experimental $FILE"
$BALLERINA_TOOL run --experimental $FILE | tee out_my
filename="${FILE%.*}"

echo ""
echo "\n###### DIFF output #######"
#diff --ignore-space-change out_ref out_my -s
diff out_lib out_my -s
rm out_lib out_my
