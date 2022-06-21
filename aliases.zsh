alias v="nvim"
alias vim="nvim"
alias vconf="pushd ~/.vim; nvim; popd"
alias vref="pushd ~/Documents/learning/learning-vim/ && nvim *.md && popd"
alias doc="docker"
alias zconf="nvim ~/.zshrc"
alias notify='terminal-notifier -title "Terminal" -message'
alias notifySound='tput bel; terminal-notifier -title "Terminal" -message'

# bat
alias cat="bat"
alias cata="bat -A"

alias la="ls -al"

# From Oh My Zsh: https://github.com/ohmyzsh/ohmyzsh/blob/e86c6f5e7fc9f024a427e2870ab70644b5454725/lib/directories.zsh
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d
