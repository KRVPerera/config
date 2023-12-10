# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GRADLE_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=\"/Users/rukshanp/Testing/CompileFeatures/cyclicTypeReference/MEMORY/dumps/build/\""
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=false

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vi_mode vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history command_execution_time root_indicator public_ip background_jobs)
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew git-extras history-substring-search yarn)

ZSH_ALIAS_FINDER_AUTOMATIC=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [ -f ~/bash_functions.sh ]; then
    . ~/bash_functions.sh
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/bash_aliases.sh ]; then
    . ~/bash_aliases.sh
fi

ulimit -S -n 65000

#export PATH=$HOME/Projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-1.3.0-SNAPSHOT/bin:$PATH

# Colorise the top Tabs of Iterm2 with the same color as background
## Just change the 18/26/33 wich are the rgb values
#echo -e "\033]6;1;bg;red;brightness;18\a"
#echo -e "\033]6;1;bg;green;brightness;26\a"
#echo -e "\033]6;1;bg;blue;brightness;33\a"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setting up java classpath for antlr
export CLASSPATH=".:/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH"

# setting up flutter
#export PATH="$PATH:${HOME}/SDKs/flutter-1.17.5/bin"
export PATH="$PATH:${HOME}/SDKs/flutter/bin"

#set -o vi
bindkey -v

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export HISTCONTROL=ignoreboth:erasedups
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from each command

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|..|...)"

CONDA_PATH_1=miniconda3
CONDA_PATH_2=miniforge3
CONDA_PATH=${CONDA_PATH_1}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/krv/${CONDA_PATH}/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/krv/${CONDA_PATH}/etc/profile.d/conda.sh" ]; then
        . "/home/krv/${CONDA_PATH}/etc/profile.d/conda.sh"
    else
        export PATH="/home/krv/${CONDA_PATH}/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/krv/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/krv/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ZPLUG_HOME=$HOME/zplug
source $ZPLUG_HOME/init.zsh
export RIOT_HOME=$HOME/projects/IOT/mini-project/RIOT

## plugins
zplug sei40kr/fast-alias-tips-bin, from:gh-r, as:command, rename-to:def-matcher

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

colorscript random
eval "$(starship init zsh)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1)
source /home/krv/.config/broot/launcher/bash/br
