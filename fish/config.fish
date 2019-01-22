set -g theme_display_date no
set -x GOPATH $HOME/Documents/go
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH $HOME/Documents/nodejs/tool $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.deno/bin $PATH
set -x LANG "ja_JP.UTF-8"
set -x GO15VENDOREXPERIMENT 1
set -x ONI_NEOVIM_PATH (which nvim)
eval (hub alias -s)

fish_vi_key_bindings
