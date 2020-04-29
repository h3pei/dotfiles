#!/bin/sh

brew update
brew upgrade

# Add Repository
brew tap sanemat/font

# CLI packages
brew install curl || true
brew install git || true
brew install jq || true
brew install lua || true
brew install nodenv || true
brew install pstree || true
brew install rbenv || true
brew install ruby-build || true
brew install tmux || true
brew install tree || true
brew install vim --with-lua --with-perl --with-python3 || true
brew install wget || true
brew install z || true
brew install zsh || true

# .dmg packages
brew cask install karabiner || true
brew cask install dropbox || true
brew cask install alfred || true
brew cask install google-chrome || true
brew cask install virtualbox || true
brew cask install vagrant || true
brew cask install appcleaner || true
brew cask install iterm2 || true
brew cask install skype || true
brew cask install google-japanese-ime || true
brew cask install firefox || true
brew cask install spectacle || true
brew cask install gyazo || true
brew cask install slack || true

brew cleanup
