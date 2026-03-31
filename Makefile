PACKAGES := git fish starship gh gitui bin brew ghostty tmux lazygit mise nvim

.PHONY: all stow unstow restow brew

all: stow

stow:
	@for pkg in $(PACKAGES); do stow --no-folding -v $$pkg; done

unstow:
	@for pkg in $(PACKAGES); do stow -Dv $$pkg; done

restow:
	@for pkg in $(PACKAGES); do stow --no-folding -Rv $$pkg; done

brew:
	brew bundle --file=~/.Brewfile
