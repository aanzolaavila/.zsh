function load_secret() {
  local name=$1
  local location=$2

  if [[ -f "$location" ]]; then
    export $name="$(cat $location)"
  else
    echo "Could not load secret $name"
  fi
}

function _zsh_load_secrets() {
  load_secret TODOIST_API_KEY "$HOME/.secrets/Todoist/api"
  export TOSHL_SECRETS_LOCATION="${HOME}/.secrets/toshl/email-sync"

  # Mercado libre personal
  load_secret MELI_APP_ID "$HOME/.secrets/MercadoLibre/appid"
  load_secret MELI_SECRET_KEY "$HOME/.secrets/MercadoLibre/secretkey)"

  load_secret BW_SESSION "$HOME/.secrets/bitwarden/session"
}
