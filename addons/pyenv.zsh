export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:${PATH}"

function _zsh_load_pyenv() {
  _evalcache pyenv init --path
  _evalcache pyenv init -

  # pyenv virtualenv
  _evalcache pyenv virtualenv-init -
}
