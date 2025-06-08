# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive dotfiles repository managing a complete development environment for a developer working primarily with Ruby/Rails, JavaScript/Vue.js, and web technologies. The setup includes shell configuration (zsh), Neovim, WezTerm, Git, tmux, and package management through Homebrew.

## Common Commands

### Setup and Installation
```bash
# Initial setup (run from home directory)
git clone git@github.com:h3pei/dotfiles.git
cd dotfiles
sh setup.sh
```

### Claude Code Configuration
The repository includes Claude Code global settings that are automatically symlinked during setup:
- `.claude/settings.json` → `~/.claude/settings.json`

### Package Management
```bash
# Install all packages from Brewfile
brew bundle

# Update Brewfile after changes
brew bundle dump --force

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
- **Symlink-based**: setup.sh creates symlinks from home directory to dotfiles
- **Modular**: Separate directories for different tools (.config/nvim, .config/wezterm, etc.)
- **Local overrides**: Supports .zshrc_local for machine-specific configurations

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
- Browser automation with Vimium configuration

## Important Patterns
- Configuration files often include both English and Japanese comments
- Heavy use of fzf for fuzzy finding across all tools
- Custom keybinding schemes that avoid conflicts between tools
- Preference for terminal-based development workflow over GUI IDEs