PS1="\[\033[01;32m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
			      
# Set the keybindings to vi mode
set -o vi

# Rust (Cargo)
export PATH=$HOME/.cargo/bin:$PATH
export RUST_BACKTRACE=full

# Java
export JDTLS_HOME=$HOME/LangServers/jdtls
export JAVA_HOME=/usr/lib/jvm/openjdk-bin-8
export PATH=$JAVA_HOME/bin:$PATH

# Local binaries
export LOCAL_PATH=$HOME/.local
export PATH=$LOCAL_PATH/bin:$PATH

# Some aliases
alias vim="nvim"

. "$HOME/.cargo/env"
