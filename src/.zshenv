## Environment Variable
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export EDITOR="emacsclient -n $@"
export FLUTTER_ROOT=$HOME/Library/flutter
export PUB_CACHE=$FLUTTER_ROOT/.pub-cache
export GOPATH=$HOME/go
export GOENV_DISABLE_GOPATH=1
export LANG=ja_JP.UTF-8
export LESS='-g -i -M -R'
export PAGER=less
export PIPENV_VENV_IN_PROJECT=1
export DBC_USER=yukiya.takagi@every.tv
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
export PATH=/usr/local/opt/mysql-client/bin:$PATH

lsp_kotlin_path="$HOME/.emacs.d/.cache/lsp/kotlin/server/bin"
if [ -d "$lsp_kotlin_path" ]; then
    export PATH=$lsp_kotlin_path:$PATH
fi

## Rust PATH
if [ -d "$HOME/.cargo" ]; then
   . "$HOME/.cargo/env"
fi
