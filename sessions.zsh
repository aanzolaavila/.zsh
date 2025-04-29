# Always run zellij by default
_not_inside_zellij() { [[ -z "$ZELLIJ" ]]; }

ensure_zellij_is_running() {
  if _not_inside_zellij; then
    taz "${HOME}"
  fi
}

ensure_zellij_is_running
zellij attach "${USER}"
