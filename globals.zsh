export TMP_PATH=$(mktemp)

function add_path() {
  local tmpf=$TMP_PATH
  local add=$1
  # echo "adding $add to $tmpf"
  echo "export PATH=$add" >> $tmpf
}

function _zsh_load_globals() {
  export PURE_CHECK_SSH=false
  export EDITOR="nvim"
}
