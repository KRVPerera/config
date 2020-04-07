#!/bin/bash

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

echo "Creating test file using ballerina"
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo "$BALLERINA_TOOL test $FILE"
#$BALLERINA_TOOL test $FILE > out_my
$BALLERINA_TOOL test test_module > out_my
filename="${FILE%.*}"

echo ""
echo "####### New output #######"
cat out_my
cat $filename.out | sed '/#/d' | sed '/\$/d' > out_ref

echo ""
echo "\n####### Old output #######"
cat out_ref

echo ""
echo "\n###### DIFF output #######"
#diff --ignore-space-change out_ref out_my -s
diff out_ref out_my -s
vimdiff out_ref out_my
rm out_ref out_my
