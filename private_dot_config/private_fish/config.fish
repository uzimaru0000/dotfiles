set -g theme_display_date no
set -x GOPATH $HOME/Documents/go
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.google-cloud-sdk/bin $PATH
set -x LANG "ja_JP.UTF-8"
set -x GO15VENDOREXPERIMENT 1
set -x ELM_HOME $HOME/.elm
set -x XDG_CONFIG_HOME $HOME/.config
set -x LSCOLORS gxfxcxdxbxegedabagacad
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin
eval (/opt/homebrew/bin/brew shellenv)
status --is-interactive; and source (nodenv init -|psub)

set -x LIBRARY_PATH $LIBRARY_PATH (brew --prefix)/lib
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@11/include"

set -gx PNPM_HOME $HOME/Library/pnpm
set -gx PATH $PNPM_HOME $PATH
set -gx PATH $HOME/.deno/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

fish_vi_key_bindings
fish_user_key_bindings

alias vim='nvim'
alias cat='bat -p'
alias ls='exa --icons'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias sed='gsed'

starship init fish | source

source ~/.config/fish/functions/ghq.fish

# pnpm
set -gx PNPM_HOME "/Users/uzimaru/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source /opt/homebrew/opt/asdf/libexec/asdf.fish

