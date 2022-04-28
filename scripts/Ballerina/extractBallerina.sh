#!/bin/bash -f

source ~/MyConfig/config/scripts/bash/functions/find_ballerina_file.sh

echo "**** Extracting $1****"
echo ""
FILE=$(find_ballerina_file $@)

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
java -jar ~/Projects/office/jars/procyon-decompiler-0.6.0.jar ${filename}.class

if [[ -z "$2" ]]; then
   exit 0 
fi


echo ""
if [[ "$2" = "clean" ]]; then
    echo "**** Cleaning $extractedDir ****"
    cd ..
    rm -rf $extractedDir
fi
