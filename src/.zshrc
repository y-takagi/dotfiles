## Environment Variable
export ANDROID_HOME=$HOME/Library/Android/sdk
export EDITOR="emacsclient -n $@"
export GOPATH=$HOME/go
export GOENV_DISABLE_GOPATH=1
export LANG=ja_JP.UTF-8
export LESS='-g -i -M -R'
export PAGER=less
export PIPENV_VENV_IN_PROJECT=1
export _Z_DATA=$HOME/.zdata/.z
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export DBC_USER=yukiya.takagi@every.tv

if [ -d "/Applications/Android Studio.app/Contents/jre/Contents/Home/" ]; then
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home/"
fi

## PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$GOPATH/bin:$PATH

lsp_kotlin_path="$HOME/.emacs.d/.cache/lsp/kotlin/server/bin"
if [ -d "$lsp_kotlin_path" ]; then
    export PATH=$lsp_kotlin_path:$PATH
fi

## Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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
alias l='ls -G'
alias ll='ls -alG'
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
