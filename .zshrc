# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -v
# End of lines configured by zsh-newuser-install

autoload -z edit-command-line
zle -N edit-command-line

bindkey "^x^e" edit-command-line
bindkey "^xe" edit-command-line
bindkey '^r' history-incremental-search-backward

autoload -Uz compinit
compinit
autoload -Uz bashcompinit && bashcompinit

export KEYTIMEOUT=1

alias ls='ls -G --color=auto'
alias rm='rm -I'

export VISUAL='vim'
export PATH=$PATH:$HOME/.local/bin/
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -Xmx2G"

autoload -U colors && colors

export TERM=screen-256color

PS1="%{$fg[magenta]%}[%{$reset_color%}%{$fg[white]%}%n@dev%{$reset_color%}:%~%{$fg[magenta]%}]%{$reset_color%}$ "

disable r

function r() {
  ou=""
  for row in $@
  do
    ou="$ou -e ${row}p"
  done
  eval "sed -n$ou"
}

function c() {
  ou=""
  for row in $@
  do
    ou="$ou \$$row \" \""
  done
  eval "awk '{ print$ou }'"
}

function replace() {
  ag -l "$1" | xargs sed -i "s/$1/$2/g"
}
