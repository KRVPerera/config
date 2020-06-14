echo "Loading aliases $0"

if [ -f ~/local_aliases.sh ]; then
    . ~/local_aliases.sh
fi

alias soc='. ~/.zshrc'
alias cls='clear'
alias c='clear'
alias quit='exit'
alias e='exit'
alias edit='gedit'
alias rm='rm -i'
alias sd='sudo shutdown -h now'
alias p='python3'
alias sdir="PS1='[\\u@\\h:\\W] \\$ '"
alias sdird="PS1='[\\@][\\u@\\h:\\W][\\!] \\$ '"
alias ssdir="PS1='$ '"
alias free='free -ht'
alias top='htop'
alias df='pydf'
alias ipconfig='ifconfig'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias antlr4='java org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias histg='history | grep'
alias hg='history | grep'
alias catn='cat -n'
alias psBal='lsof -n | grep ballerina'
alias rmJar='rm -r *jar'
alias sub='git pull --recurse-submodule'

# aliases for ballerina
alias decompile='java -jar /Applications/procyon.jar'
alias decompileGui='java -jar /Applications/jd-gui.jar'
alias runBBE='~/MyScripts/runBBE.sh'
alias debugBalB='$BALLERINA_TOOL -v; BAL_JAVA_DEBUG=5005 $BALLERINA_TOOL build'
alias debugBal='$BALLERINA_TOOL -v; BAL_JAVA_DEBUG=5005 $BALLERINA_TOOL run'
alias balB='$BALLERINA_TOOL build'
alias balR='$BALLERINA_TOOL run'
alias caBat='cat ballerina-internal.log'
alias extractBal='$HOME/MyScripts/extractBallerina.sh'
alias balDiff='~/MyScripts/balDiff.sh'
alias runAllBal='find . -type f -name "*.bal" -exec $BALLERINA_TOOL run {} \;'
alias b='$BALLERINA_TOOL'
alias bv='$BALLERINA_TOOL --version'
alias br='bv; $BALLERINA_TOOL run'
alias bb='bv; $BALLERINA_TOOL build'
alias bdi='~/MyScripts/balDiff.sh'
alias bdi_bir='~/MyScripts/balDiffBir.sh'
alias bra='bv; find . -type f -name "*.bal" -exec $BALLERINA_TOOL run {} \;'
alias bda='find . -type f -name "*.bal" -exec ~/MyScripts/balDiff.sh {} \;'
alias bdb='bv; BAL_JAVA_DEBUG=5005 $BALLERINA_TOOL build'
alias bdr='bv; BAL_JAVA_DEBUG=5005 $BALLERINA_TOOL run'
alias bh='echo $BALLERINA_TOOL;which ballerina'
alias b0='bal0'
alias b1='bal1'
alias bo='balOriginial'
alias b2='bal2'

alias downloadSongs="youtube-dl -f 'bestvideo[height<=360]+bestaudio/best[height<=360]' --download-archive Songs.txt https://www.youtube.com/playlist\?list\=PLKK_AU2B-pEoOIhsxTIKwlNTNReBQrLi3"
alias downWith5Cns="aria2c --file-allocation=none -c -x 5 --check-integrity=true"
alias downWithXCns="aria2c --file-allocation=none -c --check-integrity=true -x"


