function _zsh_load_secrets() {
  export TODOIST_API_KEY="$(cat ~/.secrets/Todoist/api)"
  export TOSHL_SECRETS_LOCATION="${HOME}/.secrets/toshl/email-sync"
}

confunctions+=_zsh_load_secrets
