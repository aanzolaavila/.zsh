# OpenSSL workaround
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-20.3.1/Contents/Home
export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-20.3.1/Contents/Home/bin:"$PATH"

# LLVM flags
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/llvm/include"

export TERM="xterm-256color"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS

# KeyRepeat workaround
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Beautify man with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $ZSH_LOCATION/configs/inputs.zsh
