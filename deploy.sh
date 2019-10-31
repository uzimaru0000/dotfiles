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

indent() {
    local n="${1:-4}"
    local p=""
    for i in `seq 1 $n`; do
        p="$p "
    done;

    local c="s/^/$p/"
    case $(uname) in
      Darwin) sed -l "$c";;
      *)      sed -u "$c";;
    esac
}

link_dotfiles() {
  ln -snfv "$1" "$2"
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

  echo '<Create-SymbolickLinks>' | indent
  args_from_env "$DOTFILES_PATH/links.env" "link_dotfiles" | indent 8
  echo '</Create-SymbolickLinks>' | indent

  echo '<Install-Application from="homebrew">' | indent
  echo "<Brew-Update>" | indent 8
  brew update | indent 12
  echo "</Brew-Update>" | indent 8
  echo "<Brew-Install>" | indent 8
  args_from_env "$DOTFILES_PATH/brew.env" "install_from_brew" | indent 12
  echo "</Brew-Install>" | indent 8
  echo "</Install-Application>" | indent

  echo '</Provisioning>'
}

main
