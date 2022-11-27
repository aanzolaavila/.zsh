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

  export TERM="xterm-256color"

  export GOPATH=$HOME/go
  add_path $PATH:$GOPATH/bin
  add_path $PATH:$HOME/.local/bin
  add_path $PATH:/Applications/MySQLWorkbench.app/Contents/MacOS

  # Beautify man with bat
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  source $ZSH_LOCATION/configs/inputs.zsh
}
