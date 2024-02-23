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

- パッケージの追加・削除をしたら dotfiles 直下で `brew bundle dump --force` を実行してBrewfileを更新する
- 新しい環境では `brew bundle` のみで同じパッケージ群をインストールできる

## Neovim

```vim
:checkhealth
:Mason
```

## fzf

```console
# Run follwing command after running `brew install`.
$(brew --prefix)/opt/fzf/install
```

see: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
