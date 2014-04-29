#!/bin/sh

cd

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/.vimrc
fi

if [ ! -e ~/.vim ]; then
  ln -s ~/dotfiles/.vim
fi

if [ ! -e ~/.zshrc ]; then
  ln -s ~/dotfiles/.zshrc
fi

if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfiles/.tmux.conf
fi

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/.gitconfig
fi

if [ ! -e ~/.vim/dotfiles/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
fi
