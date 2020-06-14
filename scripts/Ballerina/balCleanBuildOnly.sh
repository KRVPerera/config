#!/bin/bash
./gradlew clean
osascript -e 'say "Cleanfinished"'
./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild
osascript -e 'say "Build finished"'
