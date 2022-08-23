# GO
export GOPRIVATE="code.hq.twilio.com"

export SUMO_HOME=/usr/local/opt/sumo/share/sumo

# jEnv
function _zsh_load_jenv() {
  export PATH="$HOME/.jenv/bin:$PATH"
  _evalcache jenv init -
}

# already defined in addons.zsh
# async_start_worker addons_worker -n
# async_job addons_worker _zsh_load_jenv

confunctions+=_zsh_load_jenv
