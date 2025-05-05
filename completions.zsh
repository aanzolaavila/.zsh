function _zsh_load_completions() {
  if command -v ngrok &>/dev/null; then
    _evalcache ngrok completion
  fi

  if command -v pip &>/dev/null; then
    _evalcache pip completion --zsh
  fi

  if command -v pipx &>/dev/null; then
    pipx list --json | jq '.venvs.argcomplete' --exit-status >/dev/null || {
      pipx install argcomplete
    }

    _evalcache register-python-argcomplete pipx
  fi

  if command -v jj &>/dev/null; then
    _evalcache jj util completion zsh
  fi
}

deferfunctions+=_zsh_load_completions
