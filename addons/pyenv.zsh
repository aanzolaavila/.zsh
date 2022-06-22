export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:${PATH}"

function _zsh_load_pyenv() {
  if [[ ! -d "$HOME/.pyenv" ]]; then
    echo "Installing pyenv"
    git clone --recurse-submodules \
      https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
  fi

  _evalcache pyenv init --path
  _evalcache pyenv init -

  local python2_version="2.7.18"
  local python3_version="3.10.2"

  if [[ ! -d "$PYENV_ROOT/versions/$python2_version" ]] ||
    [[ ! -d "$PYENV_ROOT/versions/$python3_version" ]]; then
    echo "Installing python $python2_version and $python3_version"
    pyenv install -s $python2_version
    pyenv install -s $python3_version
    pyenv global $python2_version $python3_version
  fi

  if [[ ! -d "$PYENV_ROOT/plugins/pyenv-virtualenv" ]]; then
    git clone --recurse-submodules \
      https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
  fi

  # pyenv virtualenv
  _evalcache pyenv virtualenv-init -

  if [[ ! -d "$PYENV_ROOT/versions/neovim" ]]; then
    echo "Installing neovim virtualenv with python $python3_version"
    pyenv virtualenv $python3_version neovim
    echo 'To configure the neovim python3 virtualenv please do:
      $ pyenv activate neovim
      $ python3 -m pip install -U pip
      $ python3 -m pip install neovim
    '
  fi
}
