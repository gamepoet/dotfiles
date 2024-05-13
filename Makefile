DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)

.PHONY: test

all: macos

macos: core-macos packages

core-macos: brew git

packages: brew-packages rust-packages vscode-extensions

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile || true

rust-packages: rust
	cargo install $(shell cat $(DOTFILES_DIR)/install/Cargofile)

vscode-extensions: vscode
	for EXT in $$(cat $(DOTFILES_DIR)/install/Codefile); do code --install-extension $$EXT; done

brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

git: brew
	brew install git

rust: brew
	is-executable rustup || brew install rustup

stow: brew
	is-executable stow | brew install stow

vscode: brew
	is-executable code || brew install visual-studio-code
