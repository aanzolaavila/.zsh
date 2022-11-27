export ZSH_LOCATION="$HOME/.zsh"
export ZSH_EVALCACHE_DIR="/tmp/.zsh-evalcache"

local benchmark=false

if [[ $benchmark = true ]]; then
  zmodload zsh/zprof
fi

declare -a confunctions
declare -a deferfunctions

source $ZSH_LOCATION/globals.zsh
source $ZSH_LOCATION/zim.zsh
source $ZSH_LOCATION/addons.zsh
source $ZSH_LOCATION/neovim.zsh
source $ZSH_LOCATION/configs.zsh
source $ZSH_LOCATION/secrets.zsh
source $ZSH_LOCATION/aliases.zsh
source $ZSH_LOCATION/work.zsh


# ----- Execution -----

_zsh_load_globals
_zsh_load_zim
_zsh_load_configs
_zsh_load_secrets

# Function definitions need to come before starting the worker
async_start_worker general_worker -n

for f in ${confunctions[@]}; do
  async_job general_worker $f
  # $f
done

for f in ${deferfunctions[@]}; do
  $f
done

eval "$(cat $TMP_PATH)"
rm $TMP_PATH

# Cleanup PATH
# Taken from https://www.linuxjournal.com/content/removing-duplicate-path-entries
export PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`

source $ZSH_LOCATION/tmux.zsh

if [[ $benchmark = true ]]; then
  zprof
fi
