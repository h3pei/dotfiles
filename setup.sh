#!/bin/sh
set -ex

# oh-my-zsh
git submodule init
git submodule update

cd

conf_files=(".vimrc" ".vim" ".zshrc" ".tmux.conf" ".gitconfig")
for conf_file in ${conf_files[@]}; do
  if [ ! -e $conf_file ]; then
    ln -s ~/dotfiles/$conf_file
  fi
done

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
