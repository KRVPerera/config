#!/bin/bash
shopt -s expand_aliases
source ~/bash_aliases.sh
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

echo "Creating run file using ballerina"
b0
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo "$BALLERINA_TOOL run --dump-bir --experimental $FILE"
$BALLERINA_TOOL run --dump-bir --experimental $FILE 2>&1 | tee out_lib
filename="${FILE%.*}"

b1
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo "$BALLERINA_TOOL run --dump-bir --experimental $FILE"
$BALLERINA_TOOL run --dump-bir --experimental $FILE 2>&1 | tee out_my
filename="${FILE%.*}"

echo ""
echo "\n###### DIFF output #######"
#diff --ignore-space-change out_ref out_my -s
diff out_lib out_my -s
rm out_lib out_my
