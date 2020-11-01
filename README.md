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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

cd ~/dotfiles
brew bundle
```

## Neovim

```vim
:checkhealt
:PlugInstall
```

## iTerm2

For iTerm2 version 3.4.0, load my configuration files as follows

```txt
Preferences > General > Preferences > Load preferences from a custom folder or URL .. (/path/to/iterm2/com.googlecode.iterm2.plist)
```
