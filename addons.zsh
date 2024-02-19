source $ZSH_LOCATION/addons/iterm.zsh
source $ZSH_LOCATION/addons/pyenv.zsh
source $ZSH_LOCATION/addons/sdkman.zsh
source $ZSH_LOCATION/addons/asdf.zsh
source $ZSH_LOCATION/addons/sgpt.zsh

confunctions+=_zsh_load_iterm
confunctions+=_zsh_load_pyenv
confunctions+=_zsh_load_asdf

deferfunctions+=_zsh_load_sdkman
deferfunctions+=_zsh_load_sgpt
