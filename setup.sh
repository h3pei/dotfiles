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

if [ ! -e ~/.vim/dotfiles/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
fi
