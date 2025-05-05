function _zsh_load_treble() {
	export PNPM_HOME="/Users/aanzolaavila/Library/pnpm"
	add_path "${PNPM_HOME}"

	export NVM_DIR="$HOME/.nvm"
	[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
	[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

	add_path "$HOME/.zsh/work/treble/scripts"
}

deferfunctions+=_zsh_load_treble
