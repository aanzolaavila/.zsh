function _zsh_load_secrets() {
  if [[ -r "$HOME/.secrets.env" ]]; then
    source "$HOME/.secrets.env"
  fi
}
