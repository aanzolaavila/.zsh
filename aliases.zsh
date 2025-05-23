function _zsh_load_aliases() {
  # Notifications
  local os="$(uname -s)"
  case "${os}" in
  Linux*) {
    alias notify='notify-send -u low'
    alias notify-sound='echo -e "\a"; notify-send -u critical'
  } ;;
  Darwin*) {
    alias notify='terminal-notifier -title "Terminal" -message'
    alias notify-sound='tput bel; terminal-notifier -title "Terminal" -message'
  } ;;
  esac

  command -v bat >/dev/null && {
    alias cat="bat"
    alias cata="bat -A"
  }

  command -v terragrunt >/dev/null && {
    alias tg="terragrunt"
  }

  alias v="nvim"
  alias cl="clear"
  alias la="ls -al"
  alias lg="lazygit"

  alias prettycsv="column -t -s, | less -S -N"
  alias openports="sudo lsof -i -P -n | grep LISTEN"
  alias prettycert="{ openssl crl2pkcs7 -nocrl -certfile /dev/stdin | openssl pkcs7 -print_certs -text -noout }"

  alias work="timer 45m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -sound default -ignoreDnD"

  alias rest="timer 15m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -sound default -ignoreDnD"

  # From Oh My Zsh: https://github.com/ohmyzsh/ohmyzsh/blob/e86c6f5e7fc9f024a427e2870ab70644b5454725/lib/directories.zsh
  alias -g ...='../..'
  alias -g ....='../../..'
  alias -g .....='../../../..'
  alias -g ......='../../../../..'

  alias -- -='cd -'
  alias 1='cd +1'
  alias 2='cd +2'
  alias 3='cd +3'
  alias 4='cd +4'
  alias 5='cd +5'
  alias 6='cd +6'
  alias 7='cd +7'
  alias 8='cd +8'
  alias 9='cd +9'

  alias md='mkdir -p'
  alias rd=rmdir

  function d() {
    if [[ -n $1 ]]; then
      dirs "$@"
    else
      dirs -v | head -n 10
    fi
  }
  compdef _dirs d
}

deferfunctions+=_zsh_load_aliases
