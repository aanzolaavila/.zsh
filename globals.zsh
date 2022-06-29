<<<<<<< Updated upstream
# Where .zimrc is
export ZDOTDIR="$ZSH_LOCATION"

# zsh interactive non-login workaround
[[ ! -f "$ZDOTDIR/.zshrc" ]] && ln -s $ZSH_LOCATION/init.zsh $ZDOTDIR/.zshrc
export PURE_CHECK_SSH=false

export EDITOR="nvim"
=======
function _zsh_load_globals() {
  # Where .zimrc is
  export ZDOTDIR="$ZSH_LOCATION/zim"
  export PURE_CHECK_SSH=false
}

confunctions+=_zsh_load_globals
>>>>>>> Stashed changes
