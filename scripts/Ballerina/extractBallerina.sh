#!/bin/bash -f

echo "Extracting $1"
FILE=$1

if [ ! -f "$FILE" ]; then
    echo "A file named '$FILE' does not exists"
    exit 1
fi

if [ ! ${FILE: -4} == ".bal" ]; then
    echo "File does not have a '.bal' extention"
    exit 1
fi

echo "Using Ballerina path : $BALLERINA_TOOL"
$BALLERINA_TOOL --version
echo ""
echo "Building the ballerina file"
$BALLERINA_TOOL build $FILE
filename="${FILE%.*}"
extractedDir="${filename}_jar"

echo "$filename"
if [ ! -d "${filename}_jar" ]; then
    mkdir "${filename}_jar"
else
    echo "$extractedDir exists and I am cleaning it recursively"
    rm -rf ${filename}_jar/*
fi


cp -f ${filename}.jar $extractedDir/
cd $extractedDir
jar -xf ${filename}.jar
java -jar /Applications/procyon.jar ${filename}.class

