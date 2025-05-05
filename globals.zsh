export TMP_PATH=$(mktemp)

function add_path() {
  local tmpf=$TMP_PATH
  local add=$1
  # echo "adding $add to $tmpf"
  echo "export PATH=\"$add:\$PATH\"" >>$tmpf
}

function is_darwin() {
  [[ "$(uname -s)" == "Darwin" ]]
}

function is_linux() {
  [[ "$(uname -s)" == "Linux" ]]
}

# Set up Oh-My-Zsh env variables for plugins
# Reference: https://github.com/ohmyzsh/ohmyzsh/blob/62afbdebb96bf91c044a92b75d86f85a67da67a7/oh-my-zsh.sh
function _omz_env_variables() {
  # If ZSH is not defined, use the current script's directory.
  [[ -n "$ZSH" ]] || export ZSH="${${(%):-%x}:a:h}"
  [[ -n "$ZSH_CUSTOM" ]] || export ZSH_CUSTOM="$ZSH/custom"

  # Set ZSH_CACHE_DIR to the path where cache files should be created
  # or else we will use the default cache/
  [[ -n "$ZSH_CACHE_DIR" ]] || export ZSH_CACHE_DIR="$ZSH/cache"

  # Create cache and completions dir and add to $fpath
  mkdir -p "$ZSH_CACHE_DIR/completions"
  # (( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)
}

function _zsh_load_globals() {
  export PURE_CHECK_SSH=false
  export EDITOR="nvim"

  # Workaround while this is solved
  # https://github.com/bitwarden/clients/issues/6689
  export NODE_OPTIONS="--no-deprecation"

  _omz_env_variables
}
