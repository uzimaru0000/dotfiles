#!/bin/sh
set -e

cat <<'BANNER'
     _       _    __ _ _
  __| | ___ | |_ / _(_) | ___  ___
 / _` |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/

BANNER

# macOS only
if [ "$(uname)" != "Darwin" ]; then
  echo "This script is for macOS only."
  exit 1
fi

# Install Rosetta 2 (Apple Silicon)
if [ "$(uname -m)" = "arm64" ]; then
  softwareupdate --install-rosetta --agree-to-license 2>/dev/null || true
fi

# Install Xcode Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Xcode Command Line Tools のインストールが完了したら再度実行してください。"
  exit 0
fi

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install stow
brew install stow

# Clone dotfiles
DOTFILES_DIR="$HOME/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone https://github.com/uzimaru/.dotfiles.git "$DOTFILES_DIR"
fi
cd "$DOTFILES_DIR"

# Apply dotfiles
make stow

# Install packages
brew update
brew bundle --file=~/.Brewfile

# Apply macOS system preferences
sh "$DOTFILES_DIR/macos.sh"

echo "Done!"
