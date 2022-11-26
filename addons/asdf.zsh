function _zsh_load_asdf() {
  local asdf_dir="$HOME/.asdf"
  local plugin_dir="$asdf_dir/plugins"
  local new_plugin=false

  local plugins_str="$(cat $HOME/.tool-versions | awk '{print $1}')"
  local plugins=("${(f)plugins_str}")

  for plugin in $plugins; do
    if [[ ! -d "$plugin_dir/$plugin" ]]; then
      echo "asdf plugin $plugin not installed, installing ..."
      asdf plugin add $plugin
      new_plugin=true
    fi
  done

  if [[ $new_plugin = true ]]; then
    asdf install
  fi
}
