function load_secret() {
  local name=$1
  local location=$2

  if [[ -f "$location" ]]; then
    export $name="$(cat $location)"
  else
    echo "Could not load secret $name: $location not found"
  fi
}

function _zsh_load_secrets() {
  # ensure all secrets are protected
  local secrets_dir="$HOME/.secrets"
  mkdir -p $secrets_dir
  chmod 700 $secrets_dir
  find $secrets_dir -type d -exec chmod 700 {} \;
  find $secrets_dir -type f -exec chmod 600 {} \;

  # loading secrets

  load_secret BW_SESSION "$secrets_dir/bitwarden/session"

  load_secret TODOIST_API_KEY "$secrets_dir/Todoist/api"
  export TOSHL_SECRETS_LOCATION="$secrets_dir/toshl/email-sync"

  # Mercado libre personal
  load_secret MELI_APP_ID "$secrets_dir/MercadoLibre/appid"
  load_secret MELI_SECRET_KEY "$secrets_dir/MercadoLibre/secretkey"
}
