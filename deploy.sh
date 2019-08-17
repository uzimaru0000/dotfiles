#!/usr/bin/env bash

: ${DOTFILES_PATH:="$HOME/.dotfiles"}

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
    if [ -d "$1/$f" ]; then
      link_dotfiles "$1/$f" "$2/$f"
    else
      ln -snfv "$1/$f" "$2/$f"
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
  echo '<Provisioning>'

  echo '<Create-SymbolickLinks>'
  args_from_env "$DOTFILES_PATH/links.env" "link_dotfiles"
  echo '</Create-SymbolickLinks>'

  echo '<Install-Application from="homebrew">'
  echo "<Brew-Update>"
  brew update
  echo "</Brew-Update>"
  echo "<Brew-Install>"
  args_from_env "$DOTFILES_PATH/brew.env" "install_from_brew"
  echo "</Brew-Install>"
  echo "</Install-Application>"

  echo '</Provisioning>'
}

main
