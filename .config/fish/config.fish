# SX at login
if status --is-login
  if test -z "$DISPLAY" -a (tty) = /dev/tty1
    clear
    exec sx
  end
end

if status is-interactive
end

# Custom fish prompt
function fish_prompt
  set -l git_branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \ \1/')
  set_color cyan
  echo -n (whoami)
  set_color blue
  echo -n '@'
  set_color green
  echo -n (echo $hostname)': '
  #set_color $fish_color_cwd
  set_color blue
  echo -n (prompt_pwd)
  if test -z "$git_branch"
  else
    set_color normal
    echo -n ' on'
    set_color red 
    echo -n "$git_branch" end
  end
  echo ''
  set_color green
  echo '  '
end

# Vi key bindings
function fish_user_key_bindings
  fish_vi_key_bindings
end

# Remove fish greeting
set fish_greeting

# XBPS stuff
alias xbi='sudo xbps-install'
alias xbr='sudo xbps-remove'
alias xbq='sudo xbps-query'
alias xbu='sudo xbps-install -Suv'

# Python
#alias black="python -m black"

# System
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"

# Yarn
export PATH="(yarn global bin):$PATH"

# Rust (Cargo)
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_BACKTRACE=full

# Java
export JDTLS_HOME="/home/joaquim/LanguageServers/jdtls"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Local binaries
export LOCAL_PATH="$HOME/.local"
export PATH="$LOCAL_PATH/bin:$PATH"

# Ruby
#export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Neovim QT
#export NVIM_QT_RUNTIME_PATH="/home/joaquim/.config/nvim-qt/runtime"

# Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# Android
#export ANDROID_HOME="$HOME/Android/Sdk"

# FNM
export PATH="$HOME/.fnm:$PATH"
fnm env | source

# Starship
set -x starship_node_show_in_home false
starship init fish | source
