export ZSH_LOCATION="$HOME/.zsh"
export ZSH_EVALCACHE_DIR="/tmp/.zsh-evalcache"

local benchmark=true

if [[ $benchmark = true ]]; then
  zmodload zsh/zprof
fi

declare -a confunctions

source $ZSH_LOCATION/globals.zsh
source $ZSH_LOCATION/zim.zsh
source $ZSH_LOCATION/addons.zsh
source $ZSH_LOCATION/neovim.zsh
source $ZSH_LOCATION/configs.zsh
source $ZSH_LOCATION/secrets.zsh
source $ZSH_LOCATION/aliases.zsh

# Am I in my work?
if [[ -d "$HOME/code/owl" ]]; then
  source $ZSH_LOCATION/twilio.zsh
fi

# ----- Execution -----

_zsh_load_globals
_zsh_load_zim

# Function definitions need to come before starting the worker
async_start_worker general_worker

for f in ${functions[@]}; do
  async_job general_worker $f
done

# Cleanup PATH
# Taken from https://www.linuxjournal.com/content/removing-duplicate-path-entries
export PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`

source $ZSH_LOCATION/tmux.zsh

if [[ $benchmark = true ]]; then
  zprof
fi
