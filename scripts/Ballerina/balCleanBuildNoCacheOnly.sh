#!/bin/bash
./gradlew clean
osascript -e 'say "Cleanfinished"'
./gradlew build --no-build-cache -x createJavadoc -x check -x test -x generateDocs -x npmBuild
if [[ $SILENT == "1" ]]; then
    osascript -e 'say "Build finished"'
fi
