function _zsh_load_zim(){
  # Workaround for now
  unset ZDOTDIR

  # Check if zimfw plugin manager is missing.
  if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    echo "error: no zimfw plugin manager is available: not found in $ZIM_HOME"
  fi

  # Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
  if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    echo "Refreshing zim cache"
    source ${ZIM_HOME}/zimfw.zsh init -q
  fi

  # Initialize modules.
  source ${ZIM_HOME}/init.zsh
}
