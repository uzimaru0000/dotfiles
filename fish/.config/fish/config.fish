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
set -x EDITOR nvim
eval (/opt/homebrew/bin/brew shellenv)

# tmux 自動起動 (tmux 内・VSCode ターミナル・非対話シェルではスキップ)
# 固定 session 名 + attach-or-create で常に 1 session に集約する
if status is-interactive; and not set -q TMUX; and not set -q VSCODE_RESOLVING_ENVIRONMENT; and not set -q SSH_CONNECTION
    exec tmux new-session -A -s main -c ~
end

set -x LIBRARY_PATH $LIBRARY_PATH (brew --prefix)/lib
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@11/include"

set -gx PNPM_HOME $HOME/Library/pnpm
set -gx PATH $PNPM_HOME $PATH
set -gx PATH $HOME/.deno/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.bun/bin $PATH
set -x PATH $HOME/.vite-plus/bin $PATH


set -Ux VOLTA_HOME "$HOME/.volta"
set -Ux fish_user_paths "$VOLTA_HOME/bin" $fish_user_paths


fish_vi_key_bindings

alias vim='nvim'
alias cat='bat -p'
alias ls='eza --icons'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias sed='gsed'
alias gui='lazygit'
alias grep='rg'
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'

source ~/.config/fish/functions/ghq.fish



source /opt/homebrew/opt/asdf/libexec/asdf.fish

starship init fish | source


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/uzimaru/google-cloud-sdk/path.fish.inc' ]; . '/Users/uzimaru/google-cloud-sdk/path.fish.inc'; end
mise activate fish | source

# Added by Antigravity
fish_add_path /Users/uzimaru/.antigravity/antigravity/bin
