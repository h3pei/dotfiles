#!/bin/sh

conf_files=(".vimrc" ".vim" ".zshrc" ".tmux.conf" ".gitconfig")

git submodule init
git submodule update

cd

for conf_file in ${conf_files[@]}; do
  if [ ! -e $conf_file ]; then
    ln -s ~/dotfiles/$conf_file
  fi
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
