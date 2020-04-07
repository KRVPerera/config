./gradlew build -x :jballerina-integration-test:test -x :ballerina-http:test -x :plugin-vscode:test -x :plugin-vscode:npmBuild -x createJavadoc --stacktrace -scan --console=plain --no-daemon

./gradlew build -x :jballerina-integration-test:test -x :ballerina-http:test -x :plugin-vscode:test -x createJavadoc -x :plugin-vscode:npmBuild -x createJavadoc --stacktrace -scan --console=plain --no-daemon
