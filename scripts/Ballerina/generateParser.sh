#!/bin/zsh
cd /Users/rukshanp/Projects/ballerina-lang
cd compiler/ballerina-lang/src/main/resources/grammar
java -jar ~/Downloads/antlr-4.5.3-complete.jar *.g4 -package org.wso2.ballerinalang.compiler.parser.antlr4 -o ../../../../../ballerina-lang/src/main/java/org/wso2/ballerinalang/compiler/parser/antlr4/.
