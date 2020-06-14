#!/bin/bash
./gradlew build -x :jballerina-integration-test:test -x :plugin-vscode:test -x createBalo -x createJavadoc -x check -x test -x generateDocs -x npmBuild -x createBir -x :ballerina-rt:jar
osascript -e 'say "Build finished"'
