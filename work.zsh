# Am I at Twilio?
if [[ -d "$HOME/code/owl" ]]; then
  source $ZSH_LOCATION/work/twilio/init.zsh
fi

# Am I at Mercado Libre?
if [[ ! -z ${AT_MELI} ]]; then
  source $ZSH_LOCATION/work/meli/init.zsh
fi

if [[ ! -z ${AT_WORK} ]]; then
  source $ZSH_LOCATION/work/swiftnav/init.zsh
fi

source $ZSH_LOCATION/work/treble/init.zsh
