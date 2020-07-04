#!/bin/bash
./gradlew build -x :jballerina-integration-test:test -x :plugin-vscode:test -x createBalo -x createJavadoc -x check -x test -x generateDocs -x npmBuild -x :tracing-extensions:ballerina-choreo-extension:extractIncludeProto -x :tracing-extensions:ballerina-choreo-extension:compileJava
osascript -e 'say "Build finished"'
