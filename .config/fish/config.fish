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
    fish_default_key_bindings -M insert
    fish_vi_key_bindings insert
end

set fish_cursor_default "underscore"
set fish_cursor_insert "underscore"
set fish_cursor_visual "line"

# Remove fish greeting
set fish_greeting

# ASDF
source ~/.asdf/asdf.fish

# Yarn
export PATH="(yarn global bin):$PATH"

# Rust (Cargo)
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_BACKTRACE=full

# Java
export JDTLS_HOME="/home/joaquim/LanguageServers/jdtls"
export JAVA_HOME="/usr/lib64/openjdk-17"
export PATH="$JAVA_HOME/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Local binaries
export LOCAL_PATH="$HOME/.local"
export PATH="$LOCAL_PATH/bin:$PATH"

# Starship
set -x starship_node_show_in_home false
starship init fish | source
