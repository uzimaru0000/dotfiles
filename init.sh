#!/bin/sh
set -e

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
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install stow
brew install stow

# Apply dotfiles
make stow

# Install packages
brew bundle --no-lock --file=~/.Brewfile

echo "Done!"
