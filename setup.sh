#!/bin/sh

cd

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/.vimrc
fi

if [ ! -e ~/.vim ]; then
  ln -s ~/dotfilus/.vim
fi

if [ ! -e ~/.zshrc ]; then
  ln -s ~/dotfilus/.zshrc
fi

if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfilus/.tmux.conf
fi

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfilus/.gitconfig
fi

if [ ! -e ~/.vim/dotfiles/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
fi
