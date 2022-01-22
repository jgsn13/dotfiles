## PARAMETER 2 ##
# Black: 30
# Blue: 34
# Cyan: 36
# Green: 32
# Purple: 35
# Red: 31
# White: 37
# Yellow: 33
# Black background: 40
# Blue background: 44
# Cyan background: 46
# Green background: 42
# Purple background: 45
# Red background: 41
# White background: 47
# Yellow background: 43
## PARAMETER 3 ##
# Normal Text: 0
# Bold or Light Text: 1
# Dim Text: 2
# Underlined Text: 4
# Blinking Text: 5 (This does not work in most terminal emulators.)
# Reversed Text: 7 (This inverts the foreground and background colors)
# Hidden Text: 8

__set_prompt () {
	RESET="\[\033[00m\]"

	local git_modified_color="\[\033[1;32m\]"
	local git_status=$(git status 2>/dev/null | grep "Your branch is ahead" 2>/dev/null)
	if [ "$git_status" != "" ]
	then
		git_modified_color="\[\033[1;33m\]"
	fi
	local git_status=$(git status --porcelain 2>/dev/null)
	if [ "$git_status" != "" ]
	then
		git_modified_color="\[\033[1;31m\]"
	fi

	local git_branch=$(git branch --show-current 2>/dev/null)
	if [ "$git_branch" != "" ];
	then
		git_branch=" on $git_modified_color $git_branch$RESET "
	fi

	# brackets
	lb="\[\033[0;33m\][$RESET"
	rb="\[\033[0;33m\]]$RESET"
	sm="\[\033[0;33m\]:$RESET"

	user="\[\033[1;36m\]\u$RESET"
	symbol="\[\033[0;32m\]$RESET" #﬌ﬦ
	dir="\[\033[1;34m\]\w$RESET"
	host="\[\033[1;32m\]\H$RESET"
	at="\[\033[1;34m\]@$RESET"
	PS1="$lb$user$at$host$rb$sm $dir$git_branch\n$symbol "
}
			      
PROMPT_COMMAND='__set_prompt'

# Set the keybindings to vi mode
set -o vi

# XBPS stuff
alias xbi='sudo xbps-install'
alias xbr='sudo xbps-remove'
alias xbq='sudo xbps-query'
alias xbu='sudo xbps-install -Suv'

# Python
alias black="python -m black"

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
export JAVA_HOME=/usr/lib/jvm/openjdk11
export PATH=$JAVA_HOME/bin:$PATH

# Deno
export DENO_INSTALL=$HOME/.deno
export PATH=$DENO_INSTALL/bin:$PATH

# Local binaries
export LOCAL_PATH=$HOME/.local
export PATH=$LOCAL_PATH/bin:$PATH

# Ruby
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH

# Neovim QT
export NVIM_QT_RUNTIME_PATH=/home/joaquim/.config/nvim-qt/runtime

# Emacs
export PATH=$HOME/.emacs.d/bin:$PATH

# FNM
export PATH=$HOME/.fnm:$PATH
# eval "$(fnm env)"
