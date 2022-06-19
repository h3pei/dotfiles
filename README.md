# dotfiles

## Initial setup

```console
cd ~
git clone git@github.com:mogulla3/dotfiles.git
cd dotfiles
sh setup.sh
```

## Homebrew

```console
# Install homebrew before executing the following commands.
# see: https://brew.sh/

# Install packages by using Homebrew Bundle
cd ~/dotfiles
brew bundle
```

## zplug

```console
zplug install
```

## Neovim

```vim
:checkhealth
:PlugInstall
```

## iTerm2

For iTerm2 version 3.4.0, load my configuration files as follows

```txt
Preferences > General > Preferences > Load preferences from a custom folder or URL .. (/path/to/iterm2/com.googlecode.iterm2.plist)
```

## fzf

Run follwing command after running `brew install`.

```console
$(brew --prefix)/opt/fzf/install
```

see: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
