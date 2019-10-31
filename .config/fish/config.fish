set -g theme_display_date no
set -x GOPATH $HOME/Documents/go
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.nvm/versions/node/v10.15.3/bin $PATH
set -x PATH $HOME/.google-cloud-sdk/bin $PATH
set -x LANG "ja_JP.UTF-8"
set -x GO15VENDOREXPERIMENT 1
set -x ONI_NEOVIM_PATH (which nvim)
set -x ELM_HOME $HOME/.elm
set -x XDG_CONFIG_HOME $HOME/.config
set -x LSCOLORS gxfxcxdxbxegedabagacad
eval (hub alias -s)

fish_vi_key_bindings

alias l='ls'
alias vim='nvim'
funcsave vim

