function _zsh_sync_work_credentials(){
  echo "Executed"
  local mlmail="ceac0274-edc8-43b7-a3df-af4100ff5e2e"
  local mladmin="2ef40c52-304e-4cea-bc2c-af4700f5fffb"

  sync_bw_item_password $mlmail $mladmin
}
