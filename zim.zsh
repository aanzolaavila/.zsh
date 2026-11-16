function _zsh_zim_configs() {
  zstyle ':zim:git-info' verbose yes

  # Duration-info plugin
  zstyle ':zim:duration-info' threshold 0.5
  zstyle ':zim:duration-info' show-milliseconds yes
  zstyle ':zim:duration-info' format '(%d) '
  autoload -Uz add-zsh-hook
  add-zsh-hook preexec duration-info-preexec
  add-zsh-hook precmd duration-info-precmd

  # Same prompt as theme + duration
  PS1='%(?:%F{white}:%F{red})◼ ${VIRTUAL_ENV:+"(${VIRTUAL_ENV:t}) "}%(!:%F{red}:%F{white})%n%f%F:$(_prompt_basher_pwd)${(e)git_info[prompt]} %F{yellow}${duration_info}%F{white}%f%(!:#:$) '
  RPS1='%(?::%F{red}$?)'
}

function _zsh_load_zim() {
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

  _zsh_zim_configs
}
