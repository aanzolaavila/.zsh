# Always run zellij by default
_not_inside_zellij() { [[ -z "$ZELLIJ" ]]; }

ensure_zellij_is_running() {
  if _not_inside_zellij; then
    taz "${HOME}"
    zellij attach "${USER}"
  fi
}

ensure_zellij_is_running
