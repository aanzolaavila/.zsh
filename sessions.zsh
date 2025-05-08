# Always run tmux by default
_not_inside_tmux() { [[ -z "$TMUX" ]]; }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat "${HOME}"
  fi
}

ensure_tmux_is_running
