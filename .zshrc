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

# environment variables
export HISTFILE=~/.zsh_history
export HISTSIZE=30000
export SAVEHIST=30000
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GREP_OPTIONS='--color=auto'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
export PROMPT="
%n@%m: %B%~%b
%(?.%F{green}${1:->>}%f.%F{red}${1:->>}%f) "

# alias
alias ls="ls -G"
alias ll="ls -alG"
alias h='echo "$(hostname) ($(hostname -i))"'

# history
function select-history() {
  BUFFER=$(history -n -r 1 | $HOME/.fzf/bin/fzf --reverse --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# rbenv
eval "$(rbenv init -)"

# goenv
# eval "$(goenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# dircolors
# (!) for MacOS
eval $(gdircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal)

# utilities
function cd() {
    builtin cd $@ && ls;
}

# ssh-add
ssh-add -K ~/.ssh/id_rsa
