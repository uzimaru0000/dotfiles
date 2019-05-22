set -g theme_display_date no
set -x GOPATH $HOME/Documents/go
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH $HOME/Documents/nodejs/tool $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.deno/bin $PATH
set -x PATH $HOME/Library/Python/3.7/bin $PATH
set -x LANG "ja_JP.UTF-8"
set -x GO15VENDOREXPERIMENT 1
set -x ONI_NEOVIM_PATH (which nvim)
set -x ELM_HOME $HOME/.elm
eval (hub alias -s)

fish_vi_key_bindings

alias l='ls'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/oba/Documents/nodejs/my-helloworld/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/oba/Documents/nodejs/my-helloworld/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/oba/Documents/nodejs/my-helloworld/node_modules/tabtab/.completions/sls.fish ]; and . /Users/oba/Documents/nodejs/my-helloworld/node_modules/tabtab/.completions/sls.fish


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oba/google-cloud-sdk/path.fish.inc' ]; . '/Users/oba/google-cloud-sdk/path.fish.inc'; end
