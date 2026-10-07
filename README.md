# dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

### 1. Install Homebrew

```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

https://brew.sh/

### 2. Install chezmoi

```console
brew install chezmoi
```

### 3. Apply dotfiles

```console
chezmoi init --apply h3pei
```

You will be prompted to enter your email address during `chezmoi init`.

You will also be asked whether to set up personal agent skills. If yes, the private repo `h3pei/agent-skills` is cloned with ghq, each skill is linked into `~/.agents/skills`, and `~/.claude/skills` becomes a symlink to `~/.agents/skills`. Run `gh auth login` and `gh auth setup-git` beforehand so that the private repo can be cloned (ghq is installed via Brewfile; if it is missing, this step is skipped until the next `chezmoi apply`). Answer no on machines that don't need them (e.g. work PCs).

This will automatically:
- Deploy all dotfiles to the home directory
- Create required directories
- Install zinit

### 4. Install homebrew packages (optional)

This is a set of packages optimized for personal PCs, so installation is optional.

```console
make brew-install
```

### 5. Setup fzf (optional)

fzf must be installed via Homebrew.

```console
$(brew --prefix)/opt/fzf/install
```

### 6. Manual settings

The following settings are not managed by this repository and must be configured by hand.

#### macOS

- System Settings > Keyboard > Keyboard Shortcuts
  - Screenshots: turn off all shortcuts (to use CleanShot X instead)
  - Input Sources: turn off "Select the previous input source" (Ctrl+Space) (to use it for Raycast)
- System Settings > Keyboard > Input Sources
  - Add Google Japanese Input and remove the built-in Japanese input

#### CleanShot X

- Enable shortcuts for capture commands (after turning off the macOS screenshot shortcuts)
- Other preferences

#### Raycast

- Set the Raycast hotkey to Ctrl+Space (after turning off the macOS input source shortcut)
- Other preferences (can be migrated with "Export Settings & Data" / "Import Settings & Data")

## Daily Usage

### Editing dotfiles

Edit files directly in the home directory, then sync changes back to the chezmoi source:

```bash
# Edit as usual
vim ~/.zshrc
vim ~/.tmux.conf

# Sync all changes back to source at once
chezmoi re-add

# Or sync a specific file
chezmoi add ~/.zshrc
```

Alternatively, you can edit the source directly via `chezmoi edit`:

```bash
chezmoi edit ~/.zshrc
chezmoi apply
```

### Package management

```bash
# Update Brewfile after adding/removing packages
brew bundle dump --force --file="$(chezmoi source-path)/Brewfile"

# chezmoi apply detects Brewfile changes and runs brew bundle automatically
chezmoi apply
```
