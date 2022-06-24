function _zsh_install_tmux() {
  which tmux 2>&1 >/dev/null
  if [[ $? -ne 0 ]]; then
    echo "tmux is not installed"
    return
  fi

  local tmux_dir="$HOME/.tmux"

  mkdir -p $tmux_dir

  if [[ ! -d "$tmux_dir/plugins/tpm" ]]; then
    echo "tpm in tmux dir does not exist, cloning from git"
    mkdir -p "$tmux_dir/plugins"
    git clone https://github.com/tmux-plugins/tpm $tmux_dir/plugins/tpm
  fi

  if [[ ! -f "$HOME/.tmux.conf" ]]; then
    echo "~/.tmux.conf does not exist, linking it to zsh configs"
    ln -s $ZSH_LOCATION/configs/tmux.conf $HOME/.tmux.conf
  fi

  if [[ ! -f "$HOME/.local/bin/tat" ]]; then
    echo "tat does not exist in ~/.local/bin/tat, cloning from git"
    wget https://raw.githubusercontent.com/thoughtbot/dotfiles/master/bin/tat -O $HOME/.local/bin/tat
    chmod 755 $HOME/.local/bin/tat
  fi
}

_zsh_install_tmux

# Always run tmux by default
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running
