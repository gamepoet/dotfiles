DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := /opt/homebrew/bin:$(HOME)/.cargo/bin:$(DOTFILES_DIR)/bin:$(PATH)
SHELL := env PATH=$(PATH) /bin/bash

.PHONY: test

all: macos

macos: sudo core-macos packages link

core-macos: brew git

packages: brew-packages rust-packages vscode-extensions

link: stow
	stow -t $(HOME) runcom
	stow -t $(HOME)/.config config

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile || true

rust-packages: rust
	cargo install $(shell cat $(DOTFILES_DIR)/install/Cargofile)

vscode-extensions: vscode
	for EXT in $$(cat $(DOTFILES_DIR)/install/Codefile); do code --install-extension $$EXT; done

brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

git: brew
	brew install -q git

rust: brew
	is-executable rustup-init || brew install -q rustup-init
	is-executable rustup || rustup-init -y --no-modify-path

stow: brew
	is-executable stow | brew install -q stow

vscode: brew
	is-executable code || brew install -q visual-studio-code

sudo:
	# ask for sudo permissions and then refresh them every 60s
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
