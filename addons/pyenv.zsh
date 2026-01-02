function _zsh_load_pyenv() {
  _zsh_once pyenv && {
    add_path "$PYENV_ROOT/bin:${PATH}"
    add_path "$PYENV_ROOT/plugins/pyenv-virtualenv/shims:${PATH}"
  }

  _evalcache pyenv init --path
  _evalcache pyenv init -

  # pyenv virtualenv
  _evalcache pyenv virtualenv-init -
}
