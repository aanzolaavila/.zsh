source $ZSH_LOCATION/work/meli/credentials.zsh

function _docker_workaround() {
  if ! which docker > /dev/null; then
    brew link docker
  fi
}

function _zsh_load_meli(){
  local mlmail="ceac0274-edc8-43b7-a3df-af4100ff5e2e"
  local mladmin="2ef40c52-304e-4cea-bc2c-af4700f5fffb"
  local melisegifdb="a3c05bd8-161a-4f47-ac09-af6400fe96c4"

  alias wmail="echo 'alejandro.anzola@mercadolibre.com.co'"
  alias pmeli="bw get password $mlmail"
  alias mailtotp="bw get totp $mlmail"
  alias totp="bw get totp $mladmin"
  alias dbuser="bw get username $melisegifdb"
  alias dbpass="bw get password $melisegifdb"

  alias matcherdb='mysql matcher --host=proxysql.master.meliseginf.com --port=6612 --user="$(dbuser)" --password="$(dbpass)"'
  alias hounddb='mysql houndv2 --host=proxysql.master.meliseginf.com --port=6612 --user="$(dbuser)" --password="$(dbpass)"'

  alias colimastart="colima start --cpu 4 --memory 4 --mount-type 9p"

  # Go config for meli
  export GOPRIVATE="github.com/mercadolibre,github.com/melisource"
}

confunctions+=_zsh_sync_work_credentials
confunctions+=_docker_workaround
deferfunctions+=_zsh_load_meli
