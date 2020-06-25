#!/bin/bash -f

echo "**** Extracting $1****"
echo ""
FILE=$1

if [ ${FILE: -1} == "." ]; then
    echo "Extention is not given. Assuming '.bal'"
    FILE=${FILE}bal
fi

if [ "${#FILE}" -le 4 ]; then
    echo "File does not have a '.bal' extention. Appending"
    FILE=${FILE}.bal
    echo $FILE
fi

if [ ! ${FILE: -4} == ".bal" ]; then
    echo "File does not have a '.bal' extention. Appending"
    FILE=${FILE}.bal
    echo $FILE
fi

if [ ! -f "$FILE" ]; then
    echo "A file named '$FILE' does not exists"
    exit 1
fi

echo ""
echo "**** Building $FILE ****"
echo "Using Ballerina path : $BALLERINA_TOOL"
$BALLERINA_TOOL --version
echo ""
echo "Building the ballerina file"
$BALLERINA_TOOL build $FILE
filename="${FILE%.*}"
extractedDir="${filename}_jar"

echo ""

if [[ ! -d $extractedDir ]]; then
    mkdir "$extractedDir"
else
    echo "$extractedDir exists and I am cleaning it recursively"
    rm -rf $extractedDir/*
fi


cp -f ${filename}.jar $extractedDir/
cd $extractedDir

echo "**** Compiling ${filename}.jar ****"
jar -xf ${filename}.jar

echo ""
echo "**** Decompiling ${filename}.class ****"
java -jar /Applications/procyon.jar ${filename}.class

if [[ -z "$2" ]]; then
   exit 0 
fi


echo ""
if [[ "$2" = "clean" ]]; then
    echo "**** Cleaning $extractedDir ****"
    cd ..
    rm -rf $extractedDir
fi
