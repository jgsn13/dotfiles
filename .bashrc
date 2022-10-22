PS1="\[\033[01;32m\]\u\[\033[01;31m\]@\[\033[01;33m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
			      
# Set the keybindings to vi mode
set -o vi

# Rust (Cargo)
export PATH=$HOME/.cargo/bin:$PATH
export RUST_BACKTRACE=full

# Local binaries
export LOCAL_PATH=$HOME/.local
export PATH=$LOCAL_PATH/bin:$PATH

# Some aliases
#alias vim="nvim"
alias ll="ls -la"

. "$HOME/.cargo/env"

# ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
