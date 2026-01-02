DEFAULT_LOCATION="/private/tmp"

INITIAL_SERVERS=("default" "personal")

_not_inside_tmux() { [[ -z "$TMUX" ]]; }

get_servers() {
  local uid
  local servers
  uid="$(id -u)"
  pushd "${DEFAULT_LOCATION}/tmux-${uid}" >/dev/null || exit 1
  servers=("$(ls -l1)")
  popd >/dev/null || exit 1
  echo "${servers[@]}"
}

ensure_tmux_is_running() {
  local servers_count=($(wc -w <<<"$(get_servers)"))
  if [ "${servers_count}" -eq 0 ]; then
    for server in "${INITIAL_SERVERS[@]}"; do
      tmux -L "${server}" start
    done

    if _not_inside_tmux; then
      tat "${HOME}"
    fi
  fi
}

ensure_tmux_is_running
