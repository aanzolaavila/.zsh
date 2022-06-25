# This is done because 'zmodule input' makes the terminal crash everytime it does <Enter>
#
# Taken from https://github.com/zimfw/input/blob/master/init.zsh
# Use human-friendly identifiers.

zmodload -F zsh/terminfo +b:echoti +p:terminfo
typeset -gA key_info
key_info=(
  Control      '\C-'
  ControlLeft  '\e[1;5D \e[5D \e\e[D \eOd \eOD'
  ControlRight '\e[1;5C \e[5C \e\e[C \eOc \eOC'
  Escape       '\e'
  Meta         '\M-'
  Backspace    '^?'
  Delete       '^[[3~'
  BackTab      "${terminfo[kcbt]}"
  Left         "${terminfo[kcub1]}"
  Down         "${terminfo[kcud1]}"
  Right        "${terminfo[kcuf1]}"
  Up           "${terminfo[kcuu1]}"
  End          "${terminfo[kend]}"
  F1           "${terminfo[kf1]}"
  F2           "${terminfo[kf2]}"
  F3           "${terminfo[kf3]}"
  F4           "${terminfo[kf4]}"
  F5           "${terminfo[kf5]}"
  F6           "${terminfo[kf6]}"
  F7           "${terminfo[kf7]}"
  F8           "${terminfo[kf8]}"
  F9           "${terminfo[kf9]}"
  F10          "${terminfo[kf10]}"
  F11          "${terminfo[kf11]}"
  F12          "${terminfo[kf12]}"
  Home         "${terminfo[khome]}"
  Insert       "${terminfo[kich1]}"
  PageDown     "${terminfo[knp]}"
  PageUp       "${terminfo[kpp]}"
)

# <Ctrl-x><Ctrl-e> to edit command-line in EDITOR
autoload -Uz edit-command-line && zle -N edit-command-line && \
    bindkey "${key_info[Control]}x${key_info[Control]}e" edit-command-line
