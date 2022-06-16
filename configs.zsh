# Pyenv path
_evalcache pyenv init --path

export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-20.3.1/Contents/Home
export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-20.3.1/Contents/Home/bin:"$PATH"

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
