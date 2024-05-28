function _zsh_load_completions() {
  if command -v ngrok &>/dev/null; then
    _evalcache ngrok completion
  fi

  if command -v pip &>/dev/null; then
    _evalcache pip completion --zsh
  fi
}
