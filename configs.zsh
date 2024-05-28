function _zsh_load_linux_configs() {
  # If Homebrew is installed
  test -d /home/linuxbrew/.linuxbrew && _evalcache /home/linuxbrew/.linuxbrew/bin/brew shellenv

  # Change Caps Lock to be Escape key
  setxkbmap -option caps:swapescape

  # Change key repetitions
  xset r rate 150 45
}

function _zsh_load_configs() {
  # Custom scripts
  add_path "$HOME/.zsh/scripts:$PATH"

  # Rust
  if [ -d "$HOME/.cargo/bin" ]; then
    add_path "$HOME/.cargo/bin:$PATH"
  fi

  # OpenSSL workaround
  add_path "/usr/local/opt/openssl@1.1/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

  export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

  # LLVM flags
  add_path "/opt/homebrew/opt/llvm/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/llvm/include"

  export GOPATH=$HOME/go
  add_path $PATH:$GOPATH/bin
  add_path $PATH:$HOME/.local/bin
  is_darwin && add_path $PATH:/Applications/MySQLWorkbench.app/Contents/MacOS

  if hash nvim 2>/dev/null; then
    # use neovim as manpager
    export MANPAGER="nvim +Man!"
  else
    # beautify man with bat
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  fi

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  source $ZSH_LOCATION/configs/inputs.zsh

  is_linux && _zsh_load_linux_configs

  # Python config
  export PYTHONUSERBASE="$HOME/.local/python"
  mkdir -p $PYTHONUSERBASE
}
