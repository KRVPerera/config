#!/bin/bash

source /Users/rukshanp/bash_functions.sh

echo "running BBE : $1"
FILE=$(find_ballerina_file $@)

if [ ! -f "$FILE" ]; then
    echo "A file named $FILE does not exists"
    exit 1
fi

echo "Creating build file using ballerina"
echo "$BALLERINA_TOOL -v"
$BALLERINA_TOOL -v
$BALLERINA_TOOL home
echo "$BALLERINA_TOOL build --experimental $FILE"
$BALLERINA_TOOL build --experimental $FILE
$BALLERINA_TOOL home
filename="${FILE%.*}"
baseFileName="$(basename -- $filename)"
java -jar $baseFileName.jar > out_my 2>&1

echo ""
echo "####### New output #######"
cat out_my
cat $filename.out | sed '/#/d' | sed '/\$/d' | sed '/run/d' > out_ref

echo ""
echo "\n####### Old output #######"
cat out_ref

echo ""
echo "\n###### DIFF output #######"
#diff --ignore-space-change out_ref out_my -s
diff out_ref out_my -s

if [ -z "$2" ]; then
    rm $baseFileName.jar out_ref out_my
fi
