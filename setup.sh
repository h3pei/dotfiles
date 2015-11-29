#!/bin/sh
set -ex

# oh-my-zsh
# git submodule init
# git submodule update

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB

cd

conf_files=(".vimrc" ".vim" ".tmux.conf" ".gitconfig", ".zshrc", ".zpreztorc", ".zlogin", ".zlogout", ".zshenv", ".zprofile")
for conf_file in ${conf_files[@]}; do
  if [ ! -e $conf_file ]; then
    ln -s ~/dotfiles/$conf_file
  fi
done

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Change shell
chsh -s `which zsh` `whoami`
