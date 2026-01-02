function load_secret() {
  local name=$1
  local location=$2

  if [[ -f "$location" ]]; then
    export $name="$(cat $location)"
  else
    echo "Could not load secret $name: $location not found"
  fi
}

function load_secret_from_bw() {
  local name="${1}"
  local uuid="${2}"

  local value=$(bw get item "${uuid}" | jq '.notes' -r) || {
    echo "Failed to get secret ${name} from Bitwarden"
    false
    return
  }

  export "${name}"="${value}"
}

function refresh_bw_session() {
  command -v bw >/dev/null && {
    BW_SESSION="$(bw unlock --raw)"
    export BW_SESSION
  }
}

function _zsh_load_secrets() {
  _zsh_once "secrets" || {
    return
  }

  # Bitwarden
  # Always have fresh sessions
  refresh_bw_session || return

  load_secret_from_bw TODOIST_API_TOKEN "69d026ee-dcd4-465c-9e5d-b214006bb777"
  load_secret_from_bw OPENAI_API_KEY "39156e60-c060-4d61-8556-b00d01066322"
}
