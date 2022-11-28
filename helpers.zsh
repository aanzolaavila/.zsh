function sync_bw_item_password() {
  local from=$1
  local to=$2

  local from_password="$(bw get password $from)"
  local to_password="$(bw get password $to)"

  if [[ "$from_password" != "$to_password" ]]; then
    bw get item "$to" | jq ".login.password=\"$from_password\"" | bw encode | bw edit item "$to"
  fi
}
