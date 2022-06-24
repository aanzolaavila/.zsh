# Vim
export PATH="$PATH:$HOME/.local/bin"

# NeoVim options
export UNCRUSTIFY_CONFIG="-"

# Perl
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# TODO: This should be in neovim config itself
function _zsh_install_plug_in_neovim() {
  local vim_dir="$HOME/.vim"
  if [[ ! -d $vim_dir ]]; then
	git clone git@github.com:aanzolaavila/.vim.git $HOME/.vim
  fi

  mkdir -p "$vim_dir/autoload"
  if [[ ! -f "$vim_dir/autoload/plug.vim" ]]; then
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O autoload/plug.vim
	nvim +PlugInstall +qall
  fi
}

_zsh_install_plug_in_neovim
