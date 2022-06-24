# Where .zimrc is
export ZDOTDIR="$ZSH_LOCATION/zim"

# zsh interactive non-login workaround
[[ ! -f "$ZDOTDIR/.zshrc" ]] && ln -s $HOME/.zshrc $ZDOTDIR/.zshrc
export PURE_CHECK_SSH=false
