add_path "$PYENV_ROOT/bin:${PATH}"
add_path "$PYENV_ROOT/plugins/pyenv-virtualenv/shims:${PATH}"

function _zsh_load_pyenv() {
  _evalcache pyenv init --path
  _evalcache pyenv init -

  # pyenv virtualenv
  _evalcache pyenv virtualenv-init -
}
