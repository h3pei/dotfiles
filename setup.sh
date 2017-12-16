#!/bin/sh
set -ex

mkdir -p $HOME/bin
mkdir -p $HOME/trash
mkdir -p $HOME/.ssh

# prezto
if [ ! -e "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  git clone --recursive https://github.com/mogulla3/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# ruby dict
if [ ! -e "$HOME/dotfiles/dicts/dicts" ]; then
  git clone https://github.com/pocke/dicts.git ~/dotfiles/dicts/dicts
fi

cd

dotfiles=(".vimrc" ".vim" ".tmux.conf" ".gitconfig" ".zshrc" ".zpreztorc" ".zlogin" ".zshenv" ".zprofile")
for dotfile in ${dotfiles[@]}; do
  # Remove dotfile if exists
  if [ -e "${HOME}/${dotfile}" ]; then
    if [ -L "${HOME}/${dotfile}" ]; then
      unlink $HOME/$dotfile
    fi

    if [ -f "${HOME}/${dotfile}" ]; then
      rm -r $HOME/$dotfile
    fi

    if [ -d "${HOME}/${dotfile}" ]; then
      rm -r $HOME/$dotfile
    fi
  fi

  ln -s $HOME/dotfiles/$dotfile $HOME/$dotfile
done

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
