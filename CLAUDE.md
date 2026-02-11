# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), providing a complete development environment for a developer working primarily with Ruby/Rails, JavaScript/Vue.js, and web technologies. The setup includes shell configuration (zsh), Neovim, WezTerm, Git, tmux, and package management through Homebrew.

## Common Commands

### Setup and Installation
```bash
# New machine setup
brew install chezmoi
chezmoi init --apply h3pei

# Apply changes from source to home
chezmoi apply -v

# Check differences before applying
chezmoi diff
```

### Editing Configuration
```bash
# Edit via chezmoi (recommended)
chezmoi edit ~/.zshrc

# Or edit directly then sync back to source
chezmoi add ~/.zshrc

# Navigate to source directory
chezmoi cd
```

### Package Management
```bash
# Update Brewfile after adding/removing packages
brew bundle dump --force --file="$(chezmoi source-path)/Brewfile"

# Brewfile changes are auto-detected by run_onchange script on chezmoi apply

# Custom upgrade workflow (defined in .zsh_functions)
brew-upgrade
```

### Neovim Maintenance
```vim
:checkhealth
:Mason
:Lazy update
```

### Development Workflow
```bash
# Quick repo navigation (custom function using ghq + fzf)
gd

# History search with fzf
# Ctrl+R (bound to select-history function)
```

## Architecture and Structure

### Configuration Management
- **chezmoi-based**: Files are copied from source directory (`~/.local/share/chezmoi/`) to home
- **Source naming**: `dot_` prefix maps to `.` (e.g., `dot_zshrc` → `~/.zshrc`)
- **Templates**: `.tmpl` suffix for machine-specific files (e.g., `dot_gitconfig.tmpl`)
- **Scripts**: `.chezmoiscripts/` contains setup automation (run_once, run_onchange)
- **Local overrides**: `~/.zshrc_local` for machine-specific settings (create_ prefix, never overwritten)

### Source Directory Layout
```
~/.local/share/chezmoi/
├── .chezmoi.toml.tmpl          # Interactive config (prompts for email on init)
├── .chezmoiignore              # Files not deployed to home
├── .chezmoiscripts/
│   ├── run_once_before_create-directories.sh
│   ├── run_once_before_install-zinit.sh
│   └── run_onchange_after_brew-bundle.sh.tmpl
├── Brewfile                    # Referenced by script, not deployed to home
├── dot_zshrc                   # → ~/.zshrc
├── dot_gitconfig.tmpl          # → ~/.gitconfig (templated)
├── dot_config/
│   ├── nvim/                   # → ~/.config/nvim/
│   ├── wezterm/                # → ~/.config/wezterm/
│   ├── aerospace/              # → ~/.config/aerospace/
│   ├── borders/                # → ~/.config/borders/
│   ├── rails/                  # → ~/.config/rails/
│   └── rubocop/                # → ~/.config/rubocop/
├── dot_claude/                 # → ~/.claude/
├── private_dot_ssh/            # → ~/.ssh/ (private permissions)
└── create_dot_zshrc_local      # → ~/.zshrc_local (only if absent)
```

### Key Configuration Areas

#### Shell (.zshrc)
- Uses zinit plugin manager with prezto modules
- Pure theme with custom prompt styling
- Custom PATH including ~/bin, cargo, go, and language version managers
- History deduplication and search optimization

#### Neovim (.config/nvim/)
- Lua-based configuration using lazy.nvim plugin manager
- Modular structure with separate files for plugins, LSP, and keymaps
- Custom plugins by the repository author (h3pei namespace)
- Comprehensive LSP setup with mason.nvim for language servers

#### Version Managers
- **Ruby**: rbenv with default gems (rspec, rubocop, ruby-lsp)
- **Node.js**: nodenv
- **Python**: pyenv
- **Go**: GOPATH configuration

### Custom Functions (.zsh_functions)
- `gd()`: Repository navigation using ghq and fzf
- `brew-upgrade()`: Automated brew maintenance (update, upgrade, cleanup)
- `select-history()`: Enhanced history search with fzf

### Development Tools Integration
- **Git**: Extensive aliases (s, br, co, c, l, d, a) and nvim as default editor
- **tmux**: Vi-style keybindings with Ctrl+T prefix
- **fzf**: Integrated throughout for fuzzy finding
- **GitHub Copilot**: Configured in Neovim

## Language-Specific Notes

### Ruby/Rails Development
- Default gems include development essentials (rspec, rubocop, ruby-lsp)
- Custom Rails configuration in .railsrc
- LSP configured for Ruby development

### Web Development
- Vue.js support with vue_ls language server
- TypeScript/JavaScript tooling through various LSP servers

## Important Patterns
- Configuration files often include both English and Japanese comments
- Heavy use of fzf for fuzzy finding across all tools
- Custom keybinding schemes that avoid conflicts between tools
- Preference for terminal-based development workflow over GUI IDEs
