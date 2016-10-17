# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
unset USERNAME

export PS1="[\[\e[34m\]\u\[\e[00m\]@\[\e[36m\]\h\e[00m\]:\[\e[31m\]\w\[\e[00m\]] # "

## alias
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'

### change directory
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

### git
alias gits='git status'
alias gitb='git branch'
alias gitc='git checkout'
alias gitd='git diff'

