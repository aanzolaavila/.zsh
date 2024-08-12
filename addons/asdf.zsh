function _zsh_load_asdf() {
  local asdf_dir="$HOME/.asdf"
  local plugin_dir="$asdf_dir/plugins"
  local tool_versions_loc="$HOME/.tool-versions"

  add_path "$HOME/.asdf/shims"

  local new_plugin=false

  if [[ ! -e $tool_versions_loc ]]; then
    echo "Could not find $tool_versions_loc"
    return
  fi

  local plugins_str="$(cat $tool_versions_loc | awk '{print $1}')"
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
