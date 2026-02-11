.PHONY: brew-dump

brew-dump: ## Update Brewfile with currently installed packages
	brew bundle dump --force --file="$(CURDIR)/Brewfile"
