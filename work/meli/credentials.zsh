function _zsh_sync_work_credentials(){
  local mlmail="ceac0274-edc8-43b7-a3df-af4100ff5e2e"
  local mladmin="2ef40c52-304e-4cea-bc2c-af4700f5fffb"
  local melisegifdb="a3c05bd8-161a-4f47-ac09-af6400fe96c4"

  sync_bw_item_password $mlmail $mladmin
  sync_bw_item_password $mlmail $melisegifdb
}
