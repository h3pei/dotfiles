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
- Run `brew bundle` to install packages

### 4. Setup fzf

```console
$(brew --prefix)/opt/fzf/install
```

## Daily Usage

### Editing dotfiles

```bash
# Edit via chezmoi (recommended)
chezmoi edit ~/.zshrc

# If you edited a file directly, sync the change back to source
chezmoi add ~/.zshrc
```

### Reviewing and applying changes

```bash
# Show diff between source and target
chezmoi diff

# Apply source state to target
chezmoi apply
```

### Committing to Git

```bash
chezmoi cd
git add -A && git commit -m "message" && git push
exit
```

### Package management

```bash
# Update Brewfile after adding/removing packages
brew bundle dump --force --file="$(chezmoi source-path)/Brewfile"

# chezmoi apply detects Brewfile changes and runs brew bundle automatically
chezmoi apply
```
