autoload -Uz colors && colors

PROMPT="[%{$fg[cyan]%}%n%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}] "

# GO:q
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

export VISUAL=vim
bindkey -e

eval "$(rbenv init -)"

eval "$(dircolors ~/.dir_colors)"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias c="clear"
alias gdb="gdb -q"

# dotfiles config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
