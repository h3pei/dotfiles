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
