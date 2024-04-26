function _zsh_load_swiftnav(){
  # Go config
  export GOPRIVATE="github.com/swift-nav"

  add_path "$HOME/.zsh/work/swiftnav/scripts"
  add_path "$HOME/.tgenv/bin"

  export WALLPAPER_DIR="$HOME/.config/variety/Downloaded"

  # Secrets
  load_secret GITHUB_AUTH "$SECRETS_DIR/swift-nav/github-auth"
}

# confunctions+=_zsh_sync_work_credentials
deferfunctions+=_zsh_load_swiftnav
