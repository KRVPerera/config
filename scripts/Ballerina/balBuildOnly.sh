#!/bin/bash
./gradlew build -x createJavadoc -x check -x test -x generateDocs -x npmBuild
osascript -e 'say "Build finished"'
