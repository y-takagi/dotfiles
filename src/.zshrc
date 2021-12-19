function peco_history() {
    declare l=$(history -n 1 | LC_ALL=C sort -r | peco --query "$BUFFER")
    BUFFER="$l"
    CURSOR=${#l}
}

## history
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

## C-d によるログアウト入力を防止
setopt IGNOREEOF

## Enable zsh completions
autoload -Uz compinit && compinit

## Remove duplicates in PATH
typeset -U path

## alias
alias l='ls -G'
alias ll='ls -alG'
alias repo='cd $(ghq list -p | peco)'

zle -N peco_history
bindkey "^r" peco_history

PROMPT='%m@%c %# '
