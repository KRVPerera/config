echo "Loading local aliases : $0"
export BALLERINA_TOOLS_SNAPSHOT_NAME="jballerina-tools-2.0.0-Preview3-SNAPSHOT"

alias src="cd /Users/rukshanp/Projects/ballerina-lang"
alias build="cd /Users/rukshanp/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions"
alias src2="cd /Users/rukshanp/Projects/Ballerina/ballerina-lang"
alias refresh='~/MyCrons/SyncMaster.sh'
alias bal0='export BALLERINA_TOOL="/Library/Ballerina/bin/ballerina"; echo "BALLERINA_TOOL=$BALLERINA_TOOL";which ballerina'
alias bal1='export BALLERINA_TOOL="$HOME/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/ballerina"; echo "BALLERINA_TOOL=$BALLERINA_TOOL";which ballerina'
alias balOriginial='export BALLERINA_TOOL="$HOME/Projects/Ballerina/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/ballerina"; echo "BALLERINA_TOOL=$BALLERINA_TOOL";which ballerina'

#alias balSwanLake='export BALLERINA_TOOL="/Users/rukshanp/Downloads/SDKs/Ballerina/ballerina-swan-lake-preview1-build2/bin/ballerina"; echo "BALLERINA_TOOL=$BALLERINA_TOOL";which ballerina'

# Setting up BALLERINA_TOOL env variable

alias b0='bal0'
alias b1='bal1'
alias bo='balOriginial'
alias b2='bal2'

# building ballerina
alias buildNormal='/Users/rukshanp/MyScripts/balBuildNormal.sh'
alias bbn='buildNormal';
alias buildO='/Users/rukshanp/MyScripts/balBuildOnly.sh'
alias bbo='buildO'
alias bbDump='$BALLERINA_TOOL build --dump-bir';
alias buildTO='/Users/rukshanp/MyScripts/balBuildTaskOnly.sh'
alias bbto='buildTO'
alias buildOWB='/Users/rukshanp/MyScripts/balBuildNoBalos.sh'
alias bbowb='buildOWB'
alias buildCB='/Users/rukshanp/MyScripts/balCleanBuildOnly.sh'
alias bcb='/Users/rukshanp/MyScripts/balCleanBuildOnly.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'
alias bbOffline='/Users/rukshanp/MyScripts/balBuildOffline.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'
alias bcncb='/Users/rukshanp/MyScripts/balCleanBuildNoCacheOnly.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'

# Ballerina executors
alias runBBE='~/MyScripts/runBBE.sh'
alias extractBal='$HOME/MyScripts/extractBallerina.sh'
alias br='~/MyScripts/balTool.sh run'
alias bb='~/MyScripts/balTool.sh build'
alias b='$BALLERINA_TOOL'
alias bv='echo $BALLERINA_TOOL; $BALLERINA_TOOL --version'
alias caBat='cat ballerina-internal.log'
alias caBatc='rm ballerina-internal.log'
alias cb='caBat'
alias cbc='caBatc'
alias addMain='echo "public function main(){}" >>'

alias balDiff='~/MyScripts/balDiff.sh'
alias bro='bv; $BALLERINA_TOOL run --old-parser'
alias bdi='~/MyScripts/balDiff.sh'
alias bdi_bir='~/MyScripts/balDiffBir.sh'
alias bra='bv; find . -type f -name "*.bal" -print -exec $BALLERINA_TOOL run {} \;'
alias bda='find . -type f -name "*.bal" -exec ~/MyScripts/balDiff.sh {} \;'
alias bdb='bv; BAL_JAVA_DEBUG=5005 $BALLERINA_TOOL build'
alias bdr='bv; BAL_JAVA_DEBUG=5005 $BALLERINA_TOOL run'
alias bh='echo $BALLERINA_TOOL;which ballerina'
#alias bs='balSwanLake'
alias cf='cd ~/Testing/CompileFeatures/'
alias ci='cd ~/Testing/CompileIssues/'

alias cvim='cd ~/Projects/VimPlugin/vim-plug/ballerina-vim/'

alias grst='git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'

if [ -f ~/local_aliases_projects.sh ]; then
    . ~/local_aliases_projects.sh
fi
