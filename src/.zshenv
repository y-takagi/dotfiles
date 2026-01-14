## Environment Variable
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export EDITOR="nano"
export FLUTTER_ROOT=$HOME/Library/flutter
export PUB_CACHE=$FLUTTER_ROOT/.pub-cache
export GOPATH=$HOME/go
export GOENV_DISABLE_GOPATH=1
export LANG=ja_JP.UTF-8
export LESS='-g -i -M -R'
export PAGER=less
export PIPENV_VENV_IN_PROJECT=1
export LSP_USE_PLISTS=true

if [ -d "/Applications/Android Studio.app/Contents/jre/Contents/Home/" ]; then
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home/"
fi

## PATH
export PATH=$ANDROID_SDK_ROOT/tools:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$FLUTTER_ROOT/bin:$PATH
export PATH=$PUB_CACHE/bin:$PATH
export PATH=/opt/homebrew/opt/mysql-client@8.4/bin:$PATH
export PATH=/opt/homebrew/opt/libpq/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

## Rust PATH
if [ -d "$HOME/.cargo" ]; then
   . "$HOME/.cargo/env"
fi
