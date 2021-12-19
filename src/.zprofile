## Environment Variable
export ANDROID_HOME=$HOME/Library/Android/sdk
export EDITOR='mg'
export GOPATH=$HOME/.go
export LANG=ja_JP.UTF-8
export LESS='-g -i -M -R'
export PAGER=less
export PIPENV_VENV_IN_PROJECT=1
export _Z_DATA=$HOME/.zdata/.z
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export DBC_USER=yukiya.takagi@every.tv
export HISTSIZE=1000
export SAVEHIST=100000

if [ -d "/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/" ]; then
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/"
fi


## Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

## Zsh Completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
