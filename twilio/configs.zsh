# OpenSSL workaround
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# GO
export GOPRIVATE="code.hq.twilio.com"
export PATH="$HOME/.jenv/bin:$PATH"

# jEnv
_evalcache jenv init -

# PyEnv virtualenv
_evalcache pyenv virtualenv-init -

export SUMO_HOME=/usr/local/opt/sumo/share/sumo
