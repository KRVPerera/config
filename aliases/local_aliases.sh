export BALLERINA_TOOLS_SNAPSHOT_NAME="jballerina-tools-2201.2.0-rc1-SNAPSHOT"
export BALLERINA_TOOLS_OLD_SNAPSHOT_NAME="jballerina-tools-2201.2.0-SNAPSHOT"
export BALLERINA_TOOLS_OLD_SNAPSHOT_NAME_1="jballerina-tools-2201.1.2-SNAPSHOT"

export OFFICE_PROJECTS="~/Projects/office"

alias src="cd $OFFICE_PROJECTS/ballerina-lang"
alias spec="cd $OFFICE_PROJECTS/ballerina-spec"
alias build="cd $OFFICE_PROJECTS/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions"
alias src2="cd $OFFICE_PROJECTS/ballerina-lang-2"
alias src3="cd $OFFICE_PROJECTS/ballerina-lang-3/"
alias srcReview="cd $OFFICE_PROJECTS/Ballerina/review/"
alias srcStageSwanLake="cd $OFFICE_PROJECTS/Ballerina/stage-swan-lake/"

alias refresh='~/MyCrons/SyncMaster.sh'

# Setting up BALLERINA_TOOL env variable

alias bal0='export BALLERINA_TOOL="/usr/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal1='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal2='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang-2/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal1_old='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal1_very_old='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME_1/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal2_old='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang-2/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal3='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang-3/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'
alias bal3_old='export BALLERINA_TOOL="$OFFICE_PROJECTS/ballerina-lang-3/distribution/zip/jballerina-tools/build/extracted-distributions/$BALLERINA_TOOLS_OLD_SNAPSHOT_NAME/bin/bal"; echo "BALLERINA_TOOL=$BALLERINA_TOOL"'


alias b0='bal0'
alias b1='bal1'
alias b1_old='bal1_old'
alias b2='bal2'
alias b2_old='bal2_old'
alias b3='bal3'
alias b5='bal5'
alias b3_old='bal3_old'
alias b4='bal4'
alias bchiran='balChirans'
alias bReview='balReview'
alias bSwanLake='balStageSwanLake'

# building ballerina
alias buildNormal='~/MyScripts/balBuildNormal.sh'
alias bbn='buildNormal';
alias buildO='~/MyScripts/balBuildOnly.sh'
alias bbdto='~/MyScripts/balDebugBuildTaskOnly.sh'
alias bbo='buildO'
alias buildTO='~/MyScripts/balBuildTaskOnly.sh'
alias bbto='buildTO'
alias bbt='buildTO :jballerina-unit-test:test --tests '
alias buildOWB='~/MyScripts/balBuildNoBalos.sh'
alias bbowb='buildOWB'
alias buildCB='~/MyScripts/balCleanBuildOnly.sh'
alias bcb='~/MyScripts/balCleanBuildOnly.sh'
alias bbOffline='~/MyScripts/balBuildOffline.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'
alias bcncb='~/MyScripts/balCleanBuildNoCacheOnly.sh; git restore misc/testerina/modules/testerina-core/src/main/ballerina/Ballerina.toml'

# Ballerina executors
alias runBBE='~/MyScripts/runBBE.sh'
alias extractBal='$HOME/MyScripts/extractBallerina.sh'
alias br='~/MyScripts/balTool.sh -r -f'
alias bbDump='~/MyScripts/balTool.sh -be -f';
alias brm='~/MyScripts/balTool.sh -r -m'
alias bb='~/MyScripts/balTool.sh -b -f'
alias bbm='~/MyScripts/balTool.sh -b -m'
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
alias bh='eval "$BALLERINA_TOOL home"'

# multi runners and debuggers
#alias bra='find . -type f -name "*.bal" -print -exec "$BALLERINA_TOOL" run {} \;'
alias bda='find . -type f -name "*.bal" -exec ~/MyScripts/balDiff.sh {} \;'
alias bdb='bt -p 5005 -jb -f'
alias bdr='bt -p 5005 -jr -f'
alias bdr6='bt -p 5006 -jr -f'

# ballerina dev folders
alias cf="cd $OFFICE_PROJECTS/Testing/CompileFeatures"
alias ci="cd $OFFICE_PROJECTS/Testing/CompileIssues"
alias cvim="cd $OFFICE_PROJECTS/VimPlugin/vim-plug/ballerina-vim/"

# super lazy aliases
alias br1='br t1.bal'
alias br2='br t2.bal'

alias code='open -a "Visual Studio Code.app"'
alias nbal='java -jar ~/CLionProjects/nballerina/compiler/target/bin/nballerina.jar'

alias bare="cd $OFFICE_PROJECTS/Ballerina/ballerina-lang-bare"
alias gwp='git worktree prune'
alias swl='srcStageSwanLake'
alias scr='~/.screenlayout/three.sh'
alias sc1='~/.screenlayout/only_lap.sh'

alias dwMusic='youtube-dl --extract-audio --audio-format mp3'


alias tools='~/MyScripts/tools.sh'
## developer friendly productive apps
alias fp='flatpak'
alias fpl='flatpak list'
alias fpr='flatpak run'
alias g='git'
