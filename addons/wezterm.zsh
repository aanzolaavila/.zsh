function _zsh_load_wezterm() {
  # if not inside tmux, change the wezterm background wallpaper
  if [[ -z "$TMUX" ]]; then
    $ZSH_LOCATION/scripts/shuffle-term-wall
  fi
}
