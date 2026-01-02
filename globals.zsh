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

# Succeeds if it is the first time executing something with a name, otherwise it fails
# Useful for first time setups, like starting tmux
function _zsh_once() {
  [[ -z "${ROOT_TTY}" ]] && {
    echo "ERROR: No main ROOT_TTY identifier, cannot set unique once namespacing"
    return
  }

  local lockname="${1}"
  local tty_id=$(basename ${ROOT_TTY})

  local locks_location="/tmp/zsh-locks-${tty_id}"
  mkdir -p "${locks_location}"
  local lock_path="${locks_location}/${lockname}"

  if [[ -f "${lock_path}" ]]; then
    # lock exists, then this is not the first time
    false
  else
    touch "${lock_path}"
    true
  fi
}

function _zsh_remove_once_locks() {
  [[ -z "${ROOT_TTY}" ]] && {
    echo "ERROR: No main ROOT_TTY identifier, cannot remove once locks"
    return
  }

  if [[ "${ROOT_TTY}" != "${TTY}" ]]; then
    return
  fi

  local tty_id=$(basename ${TTY})
  local locks_location="/tmp/zsh-locks-${tty_id}"
  rm -rf "${locks_location}"
}
