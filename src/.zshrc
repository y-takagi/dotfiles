## Homebrew
if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

## anyenv
if type anyenv &>/dev/null; then
    eval "$(anyenv init -)"
fi

if type brew &>/dev/null; then
    ## Zsh Completions
    FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    ## git prompt
    git_prompt="$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
    test -r $git_prompt && . $git_prompt
fi

if type direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

## Enable zsh completions
autoload -Uz compinit && compinit

## Remove duplicates in PATH
typeset -U path

## history
HISTSIZE=1000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

## C-d によるログアウト入力を防止
setopt IGNOREEOF

## alias
alias dps='docker ps -a'
alias drm='docker rm $(docker ps -f status=exited -q)'
alias e='emacsclient -n'
alias em='open /Applications/Emacs.app'
alias l='ls -G'
alias ll='ls -alG'
alias relogin='exec $SHELL -l'
alias repo='cd $(ghq list -p | peco)'
alias tm='tmux a'

## peco history
function peco_history() {
    declare l=$(history -n 1 | tail -r | peco --query "$BUFFER")
    BUFFER="$l"
    CURSOR=${#l}
}
zle -N peco_history
bindkey "^r" peco_history

setopt prompt_subst
PS1='[%m@%c$(__git_ps1)]%# '

if [[ "$INSIDE_EMACS" = 'vterm' ]] && [[ -z "$TMUX" ]]; then
    tmux new -As0
fi
