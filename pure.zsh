fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure
PROMPT='$(tf_prompt_info)'$PROMPT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
