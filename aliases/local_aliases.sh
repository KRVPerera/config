if [[ $DEBUG == "1" ]]; then
    echo "Loading local aliases : $0"
fi
export BALLERINA_TOOLS_SNAPSHOT_NAME="jballerina-tools-2201.0.0-SNAPSHOT"
export BALLERINA_TOOLS_OLD_SNAPSHOT_NAME="jballerina-tools-2.0.0-beta.7-SNAPSHOT"
export BALLERINA_TOOLS_SNAPSHOT_NAME_5="jballerina-tools-2.0.0-beta.5-SNAPSHOT"
export BALLERINA_TOOLS_SNAPSHOT_NAME_6="jballerina-tools-2.0.0-beta.6-SNAPSHOT"

alias src="cd /Users/rukshanp/Projects/ballerina-lang"
alias build="cd /Users/rukshanp/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions"
alias src2="cd /Users/rukshanp/Projects/Ballerina/ballerina-lang"
alias src3="cd /Users/rukshanp/Projects/Ballerina/ballerina-lang-3/"
alias src4="cd /Users/rukshanp/Projects/Ballerina/ballerina-lang-4/"
alias chirans="cd /Users/rukshanp/Projects/Ballerina/chiran/"
alias review="cd /Users/rukshanp/Projects/Ballerina/review/"
alias stage-swan-lake="cd /Users/rukshanp/Projects/Ballerina/stage-swan-lake/"
alias refresh='~/MyCrons/SyncMaster.sh'
alias bal0='export BALLERINA_TOOL="/Library/Ballerina/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal1='export BALLERINA_TOOL="$HOME/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal1_old='export BALLERINA_TOOL="$HOME/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal2='export BALLERINA_TOOL="$HOME/Projects/Ballerina/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal2_old='export BALLERINA_TOOL="$HOME/Projects/Ballerina/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal3='export BALLERINA_TOOL="$HOME/Projects/Ballerina/ballerina-lang-3/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal5='export BALLERINA_TOOL="$HOME/Projects/Ballerina/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME_5/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal3_old='export BALLERINA_TOOL="$HOME/Projects/Ballerina/ballerina-lang-3/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal4='export BALLERINA_TOOL="/Users/rukshanp/Downloads/SDKs/Ballerina/bbe-Update/ballerina-swan-lake-alpha4-SNAPSHOT/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"' 
alias balChirans='export BALLERINA_TOOL="$HOME/Projects/Ballerina/chiran/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias balReview='export BALLERINA_TOOL="$HOME/Projects/Ballerina/review/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias balStageSwanLake'export BALLERINA_TOOL="$HOME/Projects/Ballerina/stage-swan-lake/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'

# Setting up BALLERINA_TOOL env variable

alias b0='bal0'
alias b1='bal1'
alias b1_old='bal1_old'
alias b2='bal2'
alias b2_old='bal2_old'
alias b3='bal3'
alias b5='bal5'
alias b3_old='bal3_old'
alias b4='bal4'
alias chiran='balChirans'
alias bReview='balReview'
alias bSwanLake='balStageSwanLake'

# building ballerina
alias buildNormal='/Users/rukshanp/MyScripts/balBuildNormal.sh'
alias bbn='buildNormal';
alias buildO='/Users/rukshanp/MyScripts/balBuildOnly.sh'
alias bbdto='/Users/rukshanp/MyScripts/balDebugBuildTaskOnly.sh'
alias bbo='buildO'
alias bbDump='$BALLERINA_TOOL build --dump-bir';
alias buildTO='/Users/rukshanp/MyScripts/balBuildTaskOnly.sh'
alias bbto='buildTO'
alias bbt='buildTO :jballerina-unit-test:test --tests '
alias buildOWB='/Users/rukshanp/MyScripts/balBuildNoBalos.sh'
alias bbowb='buildOWB'
alias buildCB='/Users/rukshanp/MyScripts/balCleanBuildOnly.sh'
alias bcb='/Users/rukshanp/MyScripts/balCleanBuildOnly.sh'
alias bbOffline='/Users/rukshanp/MyScripts/balBuildOffline.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'
alias bcncb='/Users/rukshanp/MyScripts/balCleanBuildNoCacheOnly.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'

# Ballerina executors
alias runBBE='~/MyScripts/runBBE.sh'
alias extractBal='$HOME/MyScripts/extractBallerina.sh'
alias br='~/MyScripts/balTool.sh -r -f'
alias bb='~/MyScripts/balTool.sh -b -f'
alias bt='~/MyScripts/balTool.sh'
alias b='$BALLERINA_TOOL'

# ballerina utils
alias bv='echo $BALLERINA_TOOL; $BALLERINA_TOOL --version'
alias caBat='cat ballerina-internal.log'
alias caBatc='rm ballerina-internal.log'
alias cb='caBat'
alias cbc='caBatc'
alias addMain='echo "public function main(){}" >>'
alias balDiff='~/MyScripts/balDiff.sh'
alias bdi='~/MyScripts/balDiff.sh'
alias bdi_bir='~/MyScripts/balDiffBir.sh'
alias bh='$BALLERINA_TOOL home'

# multi runners and debuggers
alias bra='bh; find . -type f -name "*.bal" -print -exec $BALLERINA_TOOL run {} \;'
alias bda='find . -type f -name "*.bal" -exec ~/MyScripts/balDiff.sh {} \;'
alias bdb='bt -p 5005 -jb -f'
alias bdr='bt -p 5005 -jr -f'
alias bdr6='bt -p 5006 -jr -f'

# ballerina dev folders
alias cf='cd ~/Testing/CompileFeatures/'
alias ci='cd ~/Testing/CompileIssues/'
alias cvim='cd ~/Projects/VimPlugin/vim-plug/ballerina-vim/'

# super lazy aliases
alias br1='br t1.bal'
alias br2='br t2.bal'

alias code='open -a "Visual Studio Code.app"'
alias nbal='java -jar ~/CLionProjects/nballerina/compiler/target/bin/nballerina.jar'

alias bare='cd ~/Projects/Ballerina/ballerina-lang-bare'
alias gwp='git worktree prune'
alias swl='stage-swan-lake'

if [ -f ~/local_aliases_projects.sh ]; then
    . ~/local_aliases_projects.sh
fi
