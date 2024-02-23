#!/bin/bash

set -ex

mkdir -p $HOME/{work,bin,trash,memo,screenshots,.ssh}

# dotfiles 直下のドットファイル
for dotfile in `ls -1a . | grep "^\." | grep -v '.gitignore'`; do
  if [ -f $dotfile ]; then
    ln -s -f `realpath $dotfile` $HOME/$dotfile
  fi
done

# .config
for config_dir in `ls -1 .config`; do
  ln -s -f -n `realpath .config/${config_dir}` $HOME/.config/
done

# rbenv
if [ -d $HOME/.rbenv ]; then
  for file in `ls -1 .rbenv/*`; do
    ln -s -f `realpath $file` $HOME/$file
  done
fi

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -e "${ZINIT_HOME}" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
