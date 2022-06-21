export SDKMAN_DIR="$HOME/.sdkman"

function _zsh_load_sdkman() {
  if [[ ! -d "$SDKMAN_DIR" ]]; then
    echo "SDKMAN is not installed, lets install it"
    curl -s "https://get.sdkman.io" | bash
  fi

  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

_zsh_load_sdkman
