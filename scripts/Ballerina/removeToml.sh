#!/bin/bash
shopt -s expand_aliases
source /Users/rukshanp/bash_functions.sh
source ~/bash_aliases.sh

rm project-api/project-api-test/src/test/resources/projects_for_resolution_integration_tests/project_o_local_dependency/Dependencies.toml
rm project-api/project-api-test/src/test/resources/projects_for_resolution_integration_tests/project_o_with_import/Dependencies.toml
rm project-api/project-api-test/src/test/resources/projects_for_resolution_integration_tests/project_o_with_import_local_dependency/Dependencies.toml
rm project-api/project-api-test/src/test/resources/projects_for_resolution_integration_tests/project_t_with_import/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/configLibProject/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/configUnionTypesProject/configUnionTypes/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/configurableCliProject/main/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/configurableProject/main/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/envVarPkg/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/testErrorProject/configPkg/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/configurables/testProject/configPkg/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/identifier/testProject/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/packaging/versions/http1.1.1/Dependencies.toml
rm tests/jballerina-integration-test/src/test/resources/packaging/versions/http1.1.2/Dependencies.toml
rm tests/jballerina-benchmark-test/src/main/ballerina/Dependencies.toml
