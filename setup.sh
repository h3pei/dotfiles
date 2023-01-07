#!/bin/sh

set -ex

mkdir -p $HOME/work
mkdir -p $HOME/bin
mkdir -p $HOME/trash
mkdir -p $HOME/memo
mkdir -p $HOME/screenshots
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/wezterm
mkdir -p $HOME/.config/solargraph
mkdir -p $HOME/.config/rubocop

# dotfiles 直下のドットファイル
for dotfile in `ls -1a . | grep "^\." | grep -v '.gitignore'`; do
  if [ -f $dotfile ]; then
    ln -s -f `realpath $dotfile` $HOME/$dotfile
  fi
done

# Neovim
ln -s -f -n `realpath .config/nvim` $HOME/.config/

# wezterm
ln -s -f -n `realpath .config/wezterm` $HOME/.config/

# solargraph
ln -s -f -n `realpath .config/solargraph` $HOME/.config/

# rubocop
ln -s -f -n `realpath .config/rubocop` $HOME/.config/

# rbenv
if [ -d $HOME/.rbenv ]; then
  for file in `ls -1 .rbenv/*`; do
    ln -s -f `realpath $file` $HOME/$file
  done
fi

# vim-plug
VIMPLUG_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -e "${VIMPLUG_HOME}" ]; then
  sh -c 'curl -fLo "${VIMPLUG_HOME}" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -e "${ZINIT_HOME}" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
