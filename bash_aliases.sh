alias c='clear'
alias cat='bat'

alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias c='clear'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias e='exit'
alias c='clear'
alias g='git'
alias edit='nvim'
alias config="cd $HOME/MyConfig/config"
alias rm='rm -i'
alias free='free -ht'

alias sd='sudo shutdown -h now'
alias logout='sudo pkill -u'

alias bak="~/MyConfig/config/backup.sh"

alias gd="git diff"
alias gds="git diff --staged"
alias gb="git branch"
alias gp="git push"
alias gl="git pull"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gst="git status"
alias gd="git diff"
alias ga="git add"
alias gco="git checkout"
alias grs="git restore"
alias grv="git remote -v"


alias hg="history | grep"
alias lg="ls | grep"
alias pg="ps -ef | grep"
alias ag="alias | grep"
alias apt_proxy="cat /etc/apt/apt.conf"

alias startvm="VBoxManage startvm"

alias logs="cd ~/logs"

alias cscope_cpp_files='ack -f --cpp > cscope.files'

## emacs life
alias emacs="emacsclient -c -a 'emacs'"

alias virt='echo $VIRTUAL_ENV'

alias nvimk='NVIM_APPNAME="nvim-kickstart" nvim'

## machine specific
alias tools="~/MyConfig/config/tools.sh"
alias cm="cd ~/masters"
alias cw="cd ~/projects/Pixelmancy"
alias jl="jupyter-lab"
