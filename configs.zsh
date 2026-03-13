function _zsh_load_linux_configs() {
  # If Homebrew is installed
  test -d /home/linuxbrew/.linuxbrew && _evalcache /home/linuxbrew/.linuxbrew/bin/brew shellenv

  # Change Caps Lock to be Escape key
  setxkbmap -option caps:swapescape

  # Change key repetitions
  xset r rate 150 45
}

function setup_rust() {
  # local asdf_rust_version=$(asdf current rust | tail -n 1 | awk '{ print $2 }')
  # local asdf_rust_path="$HOME/.asdf/installs/rust/${asdf_rust_version}"

  export CARGO_HOME="$HOME/.cargo"
  export CARGO_INSTALL_ROOT="${CARGO_HOME}"
  add_path "${CARGO_INSTALL_ROOT}/bin:$PATH"
}

function setup_openssl() {
  # OpenSSL workaround
  add_path "/usr/local/opt/openssl@1.1/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

  export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
}

function setup_llvm() {
  add_path "/opt/homebrew/opt/llvm/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/llvm/include"
}

function setup_go() {
  export GOPATH=$HOME/go
  add_path "$GOPATH/bin:$PATH"
  add_path "$HOME/.local/bin:$PATH"
  is_darwin && add_path $PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
}

function setup_manpager() {
  if hash nvim 2>/dev/null; then
    # use neovim as manpager
    export MANPAGER="nvim +Man!"
  else
    # beautify man with bat
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  fi
}

function setup_python() {
  export PYTHONUSERBASE="$HOME/.local/python"
  mkdir -p $PYTHONUSERBASE
}

function _zsh_config_setup() {
  # Ignore EOF (Ctrl+D) on the terminal to avoid sudden closing
  # unless it is pressed 10 times
  setopt ignore_eof

  # Custom scripts
  _zsh_once custom_scripts_path && add_path "$HOME/.zsh/scripts:$PATH"

  # Rust
  _zsh_once rust && setup_rust

  # OpenSSL
  _zsh_once openssl && setup_openssl

  # LLVM
  _zsh_once llvm && setup_llvm

  # Go
  _zsh_once go && setup_go

  # Manpager
  _zsh_once manpager && setup_manpager

  # Python
  _zsh_once python && setup_manpager

  source $ZSH_LOCATION/configs/inputs.zsh

  is_linux && _zsh_once linux_configs && _zsh_load_linux_configs
}

function _zsh_load_configs() {
  _zsh_config_setup

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
