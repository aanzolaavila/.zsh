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
  export SECRETS_DIR="${secrets_dir}"
  mkdir -p $secrets_dir
  chmod 700 $secrets_dir
  find $secrets_dir -type d -exec chmod 700 {} \;
  find $secrets_dir -type f -exec chmod 600 {} \;

  # loading secrets

  load_secret BW_SESSION "$secrets_dir/bitwarden/session"
  load_secret TODOIST_API_TOKEN "$secrets_dir/Todoist/api"
  load_secret OPENAI_API_KEY "$secrets_dir/openai/api"

  export TOSHL_SECRETS_LOCATION="$secrets_dir/toshl/email-sync"
}
