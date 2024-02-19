# This function was generated by `sgpt --install-integration`
function _sgpt_zsh() {
  if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
  fi
}

function _zsh_load_sgpt() {
  zle -N _sgpt_zsh
  bindkey "${key_info[Control]}g" _sgpt_zsh
}