alias soc='. ~/.zshrc'
alias cls='clear'
alias c='clear'
alias quit='exit'
alias e='exit'
alias edit='vim'
alias gv='gvim'
alias v='gvim'
alias rm='rm -i'
alias sd='sudo shutdown -h now'
alias p='python3'
alias free='free -ht'
alias top='htop'
alias df='pydf'
alias ipconfig='ifconfig'
alias antlr4='java org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias histg='history | grep'
alias hg='history | grep'
alias psBal='lsof -n | grep ballerina'
alias rmJar='rm -rf *jar'
alias sub='git pull --recurse-submodule'

# aliases for ballerina
alias decompile='java -jar /Applications/procyon.jar'
alias decompileGui='java -jar /Applications/jd-gui.jar'

alias gitCleanBal='git restore misc**; git restore composer**; git restore tool-plugins**'
alias findTCPListenPorts='lsof -PiTCP -sTCP:LISTEN'
alias downloadSongs="youtube-dl -f 'bestvideo[height<=360]+bestaudio/best[height<=360]' --download-archive Songs.txt https://www.youtube.com/playlist\?list\=PLKK_AU2B-pEoOIhsxTIKwlNTNReBQrLi3"
alias frate="~/MyScripts/frate.sh"
alias downWith5Cns="aria2c --file-allocation=none -c -x 5 --check-integrity=true"
alias d2="aria2c --file-allocation=none -c -x 2 --check-integrity=true"
alias d5=downWith5Cns
alias downWithXCns="aria2c --file-allocation=none -c --check-integrity=true -x"
alias du="youtube-dl -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]'"

alias gw='./gradlew'

alias silent='export SILENT="0"; echo "SILENT_ON=$SILENT_ON"'
alias alert='export SILENT="1"; echo "SILENT_ON=$SILENT_ON"'

alias mat="/Users/rukshanp/Applications/mat.app/Contents/MacOS/MemoryAnalyzer -vmargs -Xmx3g -XX:-UseGCOverheadLimit"

alias config="cd /home/krv/MyConfig/config"
alias qc="vim /home/krv/.config/qtile/config.py"

## exa alias
alias ls=exa
alias la="exa -al"
alias ll="exa --all --long --header --icons --git --all"
alias l1="exa -al --tree --level=2"
alias l2="exa -al --tree --level=3"
alias l3="exa -al --tree --level=4"
alias cat="bat"

## emacs life
alias emacs="emacsclient -c -a 'emacs'"
alias g="git"
alias ciot="~/projects/IOT/sense"
alias cm="~/masters"
alias cmid="~/masters/ssp"
alias cw="~/projects/DataStreamPilot"
alias cdeep="~/projects/DeepLearning/DeepLearning"
alias jl="jupyter-lab"
alias tools="~/MyConfig/config/tools.sh"
