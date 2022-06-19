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

## iTerm2

- Profileは、iTerm2 の [Dynamic Profiles](https://iterm2.com/documentation-dynamic-profiles.html) という機能を用い、JSONフォーマットで管理している。iTerm2のUIからの設定変更はJSONには反映されない。常にJSONファイルから変更する必要がある点に注意
- Profile以外の設定は `com.googlecode.iterm2.plist` ファイルにあり、こちらは現状 iTerm2 の UI から取り込むしかなさそうである
  - `Preferences > General > Preferences > Load preferences from a custom folder or URL .. (/path/to/dotfiles/iterm2/com.googlecode.iterm2.plist)`
  - 設定を変更したら自動で書き出すようにしておくと良い. iTerm2 が提供する機能として存在する
    - `Preferences > General > Preferences > Save changes` を `When Quitting` or `Automatically` にする

## zplug

```console
zplug install
```

## Neovim

```vim
:checkhealth
:PlugInstall
```

## fzf

```console
# Run follwing command after running `brew install`.
$(brew --prefix)/opt/fzf/install
```

see: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
