#!/bin/bash

echo "Extracting $1"
FILE=$1

if [ ${FILE: -1} == "." ]; then
    echo "Extention is not given. Assuming '.bal'"
    FILE=${FILE}bal
fi

if [ "${#FILE}" -le 4 ]; then
    echo "File does not have a '.bal' extention"
    FILE=${FILE}.bal
    echo $FILE
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
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
echo "$BALLERINA_TOOL build --experimental $FILE"
$BALLERINA_TOOL build --experimental $FILE
filename="${FILE%.*}"
baseFileName="$(basename -- $filename)"
java -jar $baseFileName.jar > out_my

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
rm $baseFileName.jar out_ref out_my
