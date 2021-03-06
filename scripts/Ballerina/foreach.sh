#!/bin/bash

# Declare an array of string with type
declare -a StringArray=(
"module-ballerina-math"
"module-ballerina-io" 
"module-ballerina-stringutils"
"module-ballerina-runtime"
"module-ballerina-system" 
"module-ballerina-time"
"module-ballerina-xslt"
"module-ballerina-task"
"module-ballerina-encoding"
"module-ballerina-config"
"module-ballerina-file"
"module-ballerina-crypto"
"module-ballerina-log"
"module-ballerina-reflect"
"module-ballerina-mime"
"module-ballerina-filepath"
"module-ballerina-cache"
"module-ballerina-socket"
"module-ballerinax-nats"
"module-ballerinax-rabbitmq"
"module-ballerina-email"
"module-ballerinax-kafka"
"module-ballerina-auth"
"module-ballerina-sql"
"module-ballerina-java.jdbc"
"module-ballerinax-mysql"
"module-ballerina-ldap"
"module-ballerina-http"
"module-ballerina-websub"
"module-ballerina-jwt"
"module-ballerina-oauth2"
"module-ballerina-grpc"
)

# Iterate the string array using for loop
for val in ${StringArray[@]}; do
    echo "Executing '$1' on '$val'"
    echo
    (cd $val; eval $1)
    echo
done
