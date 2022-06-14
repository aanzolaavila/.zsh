export ZSH_LOCATION="$HOME/.zsh"

local benchmark=false

if [[ $benchmark = true ]]; then
  zmodload zsh/zprof
fi

source $ZSH_LOCATION/globals.zsh
source $ZSH_LOCATION/zim.zsh
source $ZSH_LOCATION/neovim.zsh
source $ZSH_LOCATION/addons.zsh
source $ZSH_LOCATION/configs.zsh
source $ZSH_LOCATION/secrets.zsh
source $ZSH_LOCATION/aliases.zsh

# Am I in my work?
if [[ -d "$HOME/code/owl" ]]; then
  source $ZSH_LOCATION/twilio.zsh
fi

source $ZSH_LOCATION/tmux.zsh

if [[ $benchmark = true ]]; then
  zprof
fi
