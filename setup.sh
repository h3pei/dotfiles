#!/bin/sh
set -ex

mkdir -p $HOME/work
mkdir -p $HOME/bin
mkdir -p $HOME/trash
mkdir -p $HOME/memo
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config/nvim/ftplugin

cd

dotfiles=(
  ".vimrc"
  ".vim"
  ".tmux.conf"
  ".tigrc"
  ".gitconfig"
  ".zshrc"
  ".zlogin"
  ".zshenv"
  ".zprofile"
  ".pryrc"
  ".gemrc"
  ".solargraph.yml"
)

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

nvim_files=("init.vim" "coc-settings.json")
for nvim_file in ${nvim_files[@]}; do
  ln -s -f $HOME/dotfiles/.config/nvim/$nvim_file $HOME/.config/nvim/$nvim_file
done
for file in $HOME/dotfiles/.config/nvim/ftplugin/*.vim ; do
  ln -s -f $file $HOME/.config/nvim/ftplugin/`basename $file`
done

# vim-plug
if [ ! -e "${HOME}/.vim/autoload/plug.vim" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# vim-plug for Neovim
if [ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
