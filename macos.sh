#!/bin/sh
# macOS system preferences
# Usage: sh macos.sh
set -e

echo "Applying macOS system preferences..."

# === Keyboard ===
# キーリピートを速く
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# === Dock ===
# 自動的に隠す
defaults write com.apple.dock autohide -bool true
# アイコンサイズ
defaults write com.apple.dock tilesize -int 74
# 最近使ったアプリを非表示
defaults write com.apple.dock show-recents -bool false
# 最小化エフェクト: スケール
defaults write com.apple.dock mineffect -string "scale"

# === Finder ===
# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
# 表示形式: アイコン
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"

# === Trackpad ===
# タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# === Appearance ===
# ダークモード
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# スクロールバーを常に表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# === Restart affected apps ===
echo "Restarting Dock and Finder..."
killall Dock
killall Finder

echo "Done! Some changes may require a logout/restart."
