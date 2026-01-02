function _zsh_load_fzf() {
  _zsh_once fzf && {
    export FZF_COMPLETION_TRIGGER='**'
    export FZF_COMPLETION_OPTS='--border --info=inline'
  }

  _evalcache fzf --zsh
}
