function _zsh_load_twilio(){
  export OWL="$HOME/code/owl"
  _evalcache $OWL/bin/owl init -

  source $ZSH_LOCATION/work/twilio/configs.zsh
  source $ZSH_LOCATION/work/twilio/helpers.zsh
  source $ZSH_LOCATION/work/twilio/secrets.zsh
}

deferfunctions+=_zsh_load_twilio
