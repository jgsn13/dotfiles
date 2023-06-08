# SX at login
if status --is-login
  if test -z "$DISPLAY" -a (tty) = /dev/tty1
    clear
    exec startx
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

# Some aliases
alias ls="lsd"

# Remove fish greeting
set fish_greeting

export EDITOR=nvim

# Use this flag to install python (asdf or pyenv) with shared library.
# This is required for some applications:
export PYTHON_CONFIGURE_OPTS="--enable-shared"

# ASDF
source ~/.asdf/asdf.fish
export PATH="$HOME/.asdf/installs/nodejs/16.16.0/.npm/bin:$PATH"
export PATH="$HOME/.asdf/installs/python/3.10.0/bin:$PATH"

# Pyenv
export PATH="$HOME/.pyenv/shims:$PATH"

# Yarn
export PATH="(yarn global bin):$PATH"

# Rust (Cargo)
export PATH="$HOME/.cargo/bin:$PATH"
#export RUST_BACKTRACE=full

# Java
# export JDTLS_HOME="/home/joaquim/LanguageServers/jdtls"
export JAVA_HOME="/home/joaquim/.asdf/installs/java/openjdk-17.0.2"
export PATH="$JAVA_HOME/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Local binaries
export LOCAL_PATH="$HOME/.local"
export PATH="$LOCAL_PATH/bin:$PATH"
export PATH="$LOCAL_PATH/share/bin:$PATH"

# Neovim QT
export NVIM_QT_RUNTIME_PATH="/home/joaquim/.config/nvim-qt/runtime"

# Starship
set -x starship_node_show_in_home false
starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 283457
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
