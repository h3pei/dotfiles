.PHONY: brew-dump brew-install

brew-dump: ## Update Brewfile with currently installed packages
	brew bundle dump --force --no-vscode --file="$(CURDIR)/Brewfile"

brew-install: ## Install packages from Brewfile
	brew bundle --file="$(CURDIR)/Brewfile"
