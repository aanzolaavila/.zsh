export TMP_PATH=$(mktemp)

function add_path() {
  local tmpf=$TMP_PATH
  local add=$1
  # echo "adding $add to $tmpf"
  echo "export PATH=\"\$PATH:$add\"" >> $tmpf
}

function is_darwin() {
  [[ "$(uname -s)" == "Darwin" ]]
}

function is_linux() {
  [[ "$(uname -s)" == "Linux" ]]
}

function _zsh_load_globals() {
  export PURE_CHECK_SSH=false
  export EDITOR="nvim"

  # Workaround while this is solved
  # https://github.com/bitwarden/clients/issues/6689
  export NODE_OPTIONS="--no-deprecation"
}
