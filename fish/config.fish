if status is-interactive
    # Commands to run in interactive sessions can go here
end

## aliases
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
alias hw='hwinfo --short'                          # Hardware Info
alias e='exit'
alias tools='$HOME/MyScripts/tools.sh'
alias c='clear'
alias g='git'
alias config='cd $HOME/MyConfig/config'
alias soc='source ~/.config/fish/config.fish'
alias sd='sudo shutdown -h now'


alias jctl="journalctl -p 3 -xb"
## path
fish_add_path -P /home/krv/.cargo/bin
fish_add_path -P /home/krv/.local/bin
fish_add_path -P ~/MyScripts
fish_add_path -P ~/apps/lua-ls/bin
fish_add_path -P ~/apps/nvim-linux64/bin
fish_add_path -P ~/apps/zig-0.14

function random_quote
  set random_cow (exa /usr/share/cowsay/cows | shuf -n1)
  fortune -s | cowsay -f $random_cow | lolcat
end


## Run fastfetch if session is interactive
if status --is-interactive && type -q fastfetch
   fastfetch --load-config neofetch
end

random_quote
colorscript -r
source ~/bash_aliases.sh
source ~/fish_aliases.sh


starship init fish | source

