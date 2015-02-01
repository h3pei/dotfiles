#!/bin/sh

brew update
brew upgrade

# Add Repository
# brew tap phinze/homebrew-cask
# brew tap homebrew/versions
# brew tap homebrew/binary
brew tap sanemat/font

# Packages
brew install caskroom/cask/brew-cask || true
brew install brew-cask || true
brew install zsh || true
brew install git || true
brew install tmux || true
brew install lua || true
brew install vim --with-lua --with-perl --with-python3 || true
brew install curl || true
brew install wget || true
brew install tree || true
brew install pstree || true
brew install grc || true
brew install htop-osx || true
brew install ruby-build || true
brew install rbenv || true
brew install ricty || true
brew install node.js || true
brew install npm || true
brew install hg || true
brew install rsense || true

# .dmg
brew cask install karabiner || true
brew cask install dropbox || true
brew cask install alfred || true
brew cask install google-chrome || true
brew cask install yorufukurou || true
brew cask install virtualbox || true
brew cask install vagrant || true
brew cask install appcleaner || true
brew cask install iterm2 || true
brew cask install skype || true
brew cask install google-japanese-ime || true
brew cask install xtrafinder || true
brew cask install macvim || true
brew cask install kobito || true
brew cask install firefox || true
brew cask install google-drive || true
brew cask install clamxav || true
brew cask install cheatsheet || true
brew cask install magican || true
brew cask install evernote || true
brew cask install spectacle || true
brew cask install atom || true
brew cask install wireshark || true
brew cask install bettertouchtool || true
brew cask install gyazo || true
brew cask install dash || true
brew cask install slack || true

brew cleanup
