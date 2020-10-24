#!/bin/sh
set -ex

mkdir -p $HOME/work
mkdir -p $HOME/bin
mkdir -p $HOME/trash
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config/nvim

cd

dotfiles=(".vimrc" ".vim" ".tmux.conf" ".gitconfig" ".zshrc" ".zlogin" ".zshenv" ".zprofile" ".pryrc" ".tigrc" ".gemrc")
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

nvim_files=("init.vim")
for nvim_file in ${nvim_files[@]}; do
  ln -s -f $HOME/dotfiles/.config/nvim/$nvim_file $HOME/.config/nvim/$nvim_file
done

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
