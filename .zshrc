#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
eval "$(rbenv init -)"

# environment variables
export HISTFILE=~/.zsh_history
export HISTSIZE=30000
export SAVEHIST=30000
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# alias
alias ls="ls -G"
alias ll="ls -alG"

# dircolors
# (!) for MacOS
eval $(gdircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal)

# utilities
function cd() {
    builtin cd $@ && ls;
}
