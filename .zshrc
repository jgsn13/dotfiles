# Zsh completions (needs package zsh-completions)
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

# Cache for the completions
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%Sorry, no matches for: %d%b'

# Command correction
setopt correctall

# Syntax highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestion
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt
RE="%b%f"
## Sections
lb="%B%F{12}$1[$RE"
rb="%B%F{12}$1]$RE"
sm="%B%F{12}$1:$RE"
bn=$'\n'
user="%B%F{14}$1%n$RE"
prompt="%B%F{10}$1 %(!.#.) $RE" #﬌ﬦ
dir="%B%F{12}$1%1~$RE" #%~
host="%B%F{5}$1%M$RE"
at="%B%F{2}$1@$RE"
export PS1="$lb$user$at$host$rb$sm $dir$bn$prompt"

## Version Control System (git)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b) %r%f'
zstyle ':vcs_info:*' enable git
			      

# Set the keybindings to vi mode
set -o vi #bindkey -v
#function zle-line-init zle-keymap-select {
#	RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#	RPS2=$RPS1
#	zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# History
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
## Ensures that commands are added to the history immediately
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
## Add timestamp to history
setopt EXTENDED_HISTORY
## Handle duplicated commands
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# System
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH

# Yarn
export PATH=$(yarn global bin):$PATH

# Rust (Cargo)
export PATH=$HOME/.cargo/bin:$PATH
export RUST_BACKTRACE=full

# Java
export JDTLS_HOME=$HOME/LangServers/jdtls
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Deno
export DENO_INSTALL=$HOME/.deno
export PATH=$DENO_INSTALL/bin:$PATH

# Local binaries
export LOCAL_PATH=$HOME/.local
export PATH=$LOCAL_PATH/bin:$PATH

# Neovim QT
export NVIM_QT_RUNTIME_PATH=/home/joaquim/.config/nvim-qt/runtime

# FNM
export PATH=$HOME/.fnm:$PATH
# eval "$(fnm env)"
. "$HOME/.cargo/env"
