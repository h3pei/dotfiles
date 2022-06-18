#!/bin/sh

set -ex

mkdir -p $HOME/work
mkdir -p $HOME/bin
mkdir -p $HOME/trash
mkdir -p $HOME/memo
mkdir -p $HOME/screenshots
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config/nvim

# dotfiles 直下のドットファイル
for dotfile in `ls -1a . | grep "^\." | grep -v '.gitignore'`; do
  if [ -f $dotfile ]; then
    ln -s -f `realpath $dotfile` $HOME/$dotfile
  fi
done

# Neovim
ln -s -f -n `realpath .config/nvim` $HOME/.config/

# rbenv
if [ -d $HOME/.rbenv ]; then
  for file in `ls -1 .rbenv/*`; do
    ln -s -f `realpath $file` $HOME/$file
  done
fi

# vim-plug
if [ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# zplug
if [ ! -d "${HOME}/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
