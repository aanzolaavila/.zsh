# --- Keeper helper ---
typeset -g KP_CACHE="$HOME/.cache/kp_titles"

kp-refresh() {
  mkdir -p "${KP_CACHE:h}"
  rm -f ${KP_CACHE}
  keeper list --format json 2>/dev/null | jq -r '.[].title' | sort -u > "$KP_CACHE"
}

kp() {
  [[ -z $1 ]] && { echo "usage: kp <record title>"; return 1 }
  keeper find-password "$1" | pbcopy && echo "Copied (clears in 30s)"
  ( sleep 30; pbcopy </dev/null ) &!
}

_kp() {
  [[ -f $KP_CACHE ]] || kp-refresh
  local -a titles
  titles=("${(@f)$(<$KP_CACHE)}")
  _describe 'keeper record' titles
}

function load_fivn() {
  add_path "$HOME/.zsh/work/five9/scripts"
  compdef _kp kp

  ## Alias example
  alias gcloudf9='
    kubectx gke_five9-svc-qa-app1-a02b_northamerica-northeast1_five9-gke-qa-app1
    gcloud container clusters get-credentials five9-gke-qa-app1 --region northamerica-northeast1 --project five9-svc-qa-app1-a02b || { gcloud auth login; gcloud auth application-default login; }
  '

  alias os="openstack"
}

oscloud() {
  local file="${OS_CLIENT_CONFIG_FILE:-${HOME}/.config/openstack/clouds.yaml}"
  local cloud
  cloud=$(yq '.clouds | keys | .[]' "$file" | fzf --prompt="OS_CLOUD> " --height=40%) || return
  export OS_CLOUD="$cloud"
  echo "OS_CLOUD=$OS_CLOUD"
}

function _zsh_load_fivn() {
  load_fivn
}

deferfunctions+=_zsh_load_fivn
