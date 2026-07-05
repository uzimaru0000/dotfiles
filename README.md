# dotfiles

macOS 向けの個人用 dotfiles。[GNU Stow](https://www.gnu.org/software/stow/) でシンボリックリンクを管理。

## セットアップ

新しい Mac では以下を実行するだけで完了:

```sh
curl -fsSL https://raw.githubusercontent.com/uzimaru/.dotfiles/main/init.sh | sh
```

`init.sh` が以下を自動で行います:

1. Rosetta 2 のインストール (Apple Silicon)
2. Xcode Command Line Tools のインストール
3. Homebrew のインストール
4. dotfiles のクローン (`~/.dotfiles`)
5. `make stow` でシンボリックリンクの作成
6. `brew bundle` でパッケージのインストール

## 構成

```
.dotfiles/
├── bin/        # カスタムスクリプト (~/.local/bin/)
├── brew/       # Homebrew Brewfile (~/.Brewfile)
├── fish/       # Fish shell 設定 (~/.config/fish/)
├── gh/         # GitHub CLI 設定 (~/.config/gh/)
├── ghostty/    # Ghostty ターミナル設定 (~/.config/ghostty/)
├── git/        # Git 設定 (~/.gitconfig, ~/.gitignore_global)
├── gitui/      # GitUI 設定 (~/.config/gitui/)
├── herdr/      # herdr 設定 (~/.config/herdr/)
├── lazygit/    # LazyGit 設定 (~/.config/lazygit/)
├── mise/       # mise ランタイム管理 (~/.config/mise/)
├── nvim/       # Neovim 設定 (~/.config/nvim/)
├── starship/   # Starship プロンプト設定 (~/.config/starship.toml)
├── tmux/       # tmux 設定 (~/.config/tmux/)
├── init.sh     # 初期セットアップスクリプト
└── Makefile    # stow コマンドのラッパー
```

## コマンド

```sh
make stow     # シンボリックリンクを作成
make unstow   # シンボリックリンクを削除
make restow   # シンボリックリンクを再作成
make brew     # Brewfile からパッケージをインストール
```

## 主なツール

- **Shell**: Fish + Starship
- **Editor**: Neovim
- **Terminal**: Ghostty / iTerm2
- **Git**: lazygit, git-delta, gh
- **CLI**: bat, eza, ripgrep, jq, direnv
