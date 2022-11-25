function _zsh_load_meli(){
  local mlmail="ceac0274-edc8-43b7-a3df-af4100ff5e2e"
  local mladmin="2ef40c52-304e-4cea-bc2c-af4700f5fffb"

  alias wmail="echo 'alejandro.anzola@mercadolibre.com.co'"
  alias pmeli="bw get password $mlmail"
  alias mailtotp="bw get totp $mlmail"
  alias totp="bw get totp $mladmin"
}

deferfunctions+=_zsh_load_meli
