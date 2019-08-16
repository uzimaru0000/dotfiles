#!/usr/bin/env bash

: ${DOTFILES_PATH:="$HOME/Documents/dotfiles"}

args_from_env() {
  if [ ! -e $1 ]; then
    echo "$1 is not exist." 1>&2
    exit 1
  fi

  cat $1 | grep -v "# *" | sed 's/=/ /' | while read key value
  do
    eval key=$key
    eval value=$value
    eval "$2 $key $value"
  done
}

link_dotfiles() {
  for f in `ls -a $1 | grep -E "[^\.]"`
  do 
    if [ -d "$DOTFILES_PATH/$1/$f" ]; then
      link_dotfiles "$1/$f" "$2/$f"
    else
      ln -snfv "$DOTFILES_PATH/$1/$f" "$2/$f"
    fi

  done
}

install_from_brew() {
  if [ $2 -eq 0 ]; then
    eval brew install $1
  else
    eval brew cask install $1
  fi
}

main() {
  echo -e 'Provisioning...\n'

  echo 'Create SymbolickLinks...'
  args_from_env "$DOTFILES_PATH/links.env" "link_dotfiles"

  echo "install application from homebrew"
  echo "brew update..."
  brew update
  echo "done"
  args_from_env "$DOTFILES_PATH/brew.env" "install_from_brew"

  echo -e '\ndone'
}

main
