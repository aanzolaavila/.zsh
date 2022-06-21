function _zsh_asdf_install_plugins() {
  local asdf_dir="$HOME/.asdf"
  local plugin_dir="$asdf_dir/plugins"
  local new_plugin=false

  local plugins_str="$(cat $ZSH_LOCATION/tool-versions | awk '{print $1}')"
  local plugins=("${(f)plugins_str}")

  for plugin in $plugins; do
    if [[ ! -d "$plugin_dir/$plugin" ]]; then
      asdf plugin add $plugin
      new_plugin=true
    fi
  done

  if [[ $new_plugin = true ]]; then
    asdf install
  fi
}

_zsh_asdf_install_plugins
