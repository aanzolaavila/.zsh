source $ZSH_LOCATION/addons/iterm.zsh
source $ZSH_LOCATION/addons/pyenv.zsh
source $ZSH_LOCATION/addons/sdkman.zsh
source $ZSH_LOCATION/addons/asdf.zsh

# Function definitions need to come before starting the worker
async_start_worker addons_worker -n

async_job addons_worker _zsh_load_iterm
async_job addons_worker _zsh_load_pyenv
async_job addons_worker _zsh_load_sdkman
async_job addons_worker _zsh_load_asdf
