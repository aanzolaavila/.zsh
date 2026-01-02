export ZSH_EVALCACHE_DIR="/tmp/.zsh-evalcache"

# Define unique identifier coming from first tty to exist
[[ -z "${ROOT_TTY}" ]] && {
  export ROOT_TTY="${TTY}"
}

local benchmark=false

if [[ $benchmark = true ]]; then
  zmodload zsh/zprof
fi

declare -a confunctions
declare -a deferfunctions

# ensure that these arrays are empty, useful when doing 'source ~/.zshrc'
confunctions=()
deferfunctions=()

source $ZSH_LOCATION/globals.zsh
source $ZSH_LOCATION/zim.zsh
source $ZSH_LOCATION/addons.zsh
source $ZSH_LOCATION/neovim.zsh
source $ZSH_LOCATION/configs.zsh
source $ZSH_LOCATION/secrets.zsh
source $ZSH_LOCATION/aliases.zsh
source $ZSH_LOCATION/completions.zsh
source $ZSH_LOCATION/helpers.zsh
source $ZSH_LOCATION/work.zsh

# ----- Execution -----

_zsh_load_globals
_zsh_load_zim
_zsh_load_configs
_zsh_load_secrets

# Function definitions need to come before starting the worker
async_start_worker general_worker -u -n

function worker_callback() {
  local job_name=$1
  local return_code=$2
  local result=$3
  local execution_time=$4
  local error_result=$5
  local has_next_result=$6

  printf "name: %s, return_code: %s, time: %s\n" "$job_name" "$return_code" "$execution_time"
  printf "has_next_result: %s\n" "$has_next_result"
  printf "result: %s\n" "$result"
}

for f in ${confunctions[@]}; do
  async_job general_worker $f
  # $f
done

for f in ${deferfunctions[@]}; do
  $f
done

_zsh_once path && {
  eval "$(cat $TMP_PATH)"
  rm $TMP_PATH

  # Cleanup PATH
  # Taken from https://www.linuxjournal.com/content/removing-duplicate-path-entries
  export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
}

source $ZSH_LOCATION/sessions.zsh

if [[ $benchmark = true ]]; then
  zprof
fi

# Remove locks when tty is terminating
trap _zsh_remove_once_locks EXIT

# async_process_results general_worker worker_callback
