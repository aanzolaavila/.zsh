# Am I at Twilio?
if [[ -d "$HOME/code/owl" ]]; then
  source $ZSH_LOCATION/work/twilio/init.zsh
fi

# Am I at Mercado Libre?
if [[ -f "$HOME/meli.lock" ]]; then
  source $ZSH_LOCATION/work/meli/init.zsh
fi
