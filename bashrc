# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias soc="source ~/.bashrc"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/bash_aliases.sh ]; then
    . ~/bash_aliases.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export JAVA_HOME="/usr/lib/jvm/jdk.1.8.0_92"
export JRE_HOME="$JAVA_HOME/jre"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/apps/zig-0.14:$PATH"

function smp() {
	printf '\n---------------- Set mora proxy env --------------\n'
    export {http,ftp,socks}_proxy='http://xxx:xxx/'
	export all_proxy='http://xxx:xxx/'
    echo "export {http,ftp,socks}_proxy='http://xxx:xxx/'"
	export https_proxy='https://xxx:xxx/'
	echo export https_proxy='https://xxx:xxx/'
	printf '\n---------------- Test env --------------\n'
	echo env | grep proxy
	env | grep proxy
	printf '\n'
}

function asmp() {
	printf '\n---------------- Unset mora proxy env --------------\n'
    unset {http,https,ftp,socksi,all}_proxy
    echo "unset {http,https,ftp,socks,all}_proxy"
	printf '\n---------------- Test env --------------------------\n'
	echo "env | grep proxy"
	env | grep proxy
}

function gsp(){
	git config --global http.proxy "http://xxx:xxx"
	git config --global https.proxy "https://xxx:xxx"
}
function agsp(){
	git config --global --unset http.proxy 
	git config --global --unset https.proxy 
}

new-alias () { 
  if [ -z "$1" ]; then
    echo "alias name:"
    read NAME
  else
    NAME=$1
  fi

  if [ -z "$2" ]; then
    echo "alias definition:"
    read DEFINTION
  else
    if [ "$2" = "-cd" ]; then
      DEFINTION='cd '
    else
      DEFINTION=$2
    fi
  fi

  echo "alias $NAME='$DEFINTION'" >> ~/.bashrc
  . ~/.bashrc
}

function cdc(){
	pwd | xclip
}

function cdv(){
	cd `xclip -o`
}

function brightness () {
	arg="$1"
	max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
	actual_brightness=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
	let	wanted=$(expr $arg)
	echo "Actual is : $actual_brightness"
	echo "Max is : $max_brightness"
	if [ $wanted -ge $max_brightness ]; then
		wanted=$max_brightness
	fi
	echo "Changed to : $wanted"
	echo $wanted |sudo tee /sys/class/backlight/intel_backlight/brightness
}

function bColor(){
	if [ -z "$1" ]; then
		col_num=$1
		echo "Colour Codes : "
		read col_num
	else
		if [ $1 =  "h" ]; then
			echo "Black : 30"
			echo "Red   : 31"
			echo "Green : 32"
			echo "Brown : 33"
			echo "Blue  : 34"
			echo "Purple: 35"
			echo "Cyan  : 36"
			echo "Usage : bColor col# [1|0]"
			return 0
		fi
		col_num=$1
	fi

	if [ -z "$2" ]; then
		light=1
	else
		light=$2
		if [ "$2" -eq 1 ]; then
			echo "Color will be darker"
		elif [ "$2" -eq 0 ]; then
			echo "Color will be lighter"
		else
			echo "Invalid lightness! Set to darker"
			light=1
		fi
	fi
	echo `expr index  "$PS1" '[01];[30-36]m'`
	echo "export PS1='\e[$light;$col_num m PS1 \e[m'"
	PS1="\e["$light";"$col_num"m"$PS1"\e[m"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
#
 eval "$(starship init bash)"

source /home/krv/.config/broot/launcher/bash/br
