#!/bin/bash
shopt -s expand_aliases
source /Users/rukshanp/bash_functions.sh
source ~/bash_aliases.sh

FILE=$(find_ballerina_file $@)

if [ ! -f "$FILE" ]; then
    echo "A file named '$FILE' does not exists"
    exit 1
fi

echo
echo "running baldiffer for : $FILE"
echo

echo "############# Building the '$FILE' in library build ############"
b0
echo "$BALLERINA_TOOL -v"
bv
echo
echo "$BALLERINA_TOOL run --experimental $FILE"
$BALLERINA_TOOL run --experimental $FILE 2>&1 | tee out_lib
echo "################################################################"

echo
echo "############ Building the '$FILE' in my build ##################"
b1
echo "$BALLERINA_TOOL -v"
bv
echo
echo "$BALLERINA_TOOL run --experimental $FILE"
$BALLERINA_TOOL run --experimental $FILE 2>&1 | tee out_my
echo "################################################################"

echo ""
echo "######################### DIFF output ##########################"
#diff --ignore-space-change out_ref out_my -s
diff out_lib out_my -s
rm -f out_lib out_my
