# zplug
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async", from:github
zplug "modules/completion", from:prezto
zplug "modules/history", from:prezto
zplug "modules/terminal", from:prezto
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", as:plugin, defer:2

zplug load

# prezto
if [[ -s "${ZPLUG_REPOS}/sorin-ionescu/prezto/init.zsh" ]]; then
  source "${ZPLUG_REPOS}/sorin-ionescu/prezto/init.zsh"
fi

# pure (zsh theme)
autoload -U promptinit; promptinit
zstyle ":prompt:pure:git:branch" color "yellow"
zstyle ":prompt:pure:git:stash" show yes
zstyle ":prompt:pure:path" color "white"
zstyle ":prompt:pure:prompt:success" color "green"

setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# %n: username
# %m: hostname
# %y: tty name
# %~: current directory
# %B..%b: bolding ..
# %F..%f: coloring .. foreground
# %? : return value of previous command
# export PROMPT="
# %n@%m(%y): %F{magenta}%B%~%b%f
# %(?.%F{green}${1:-$}%f.%F{red}${1:-$}%f) "

# Aliases
alias ls="ls -G"
alias ll="ls -alG"
alias h='echo "$(hostname) ($(hostname -i))"'
alias vim='nvim'
alias memo="vim ${HOME}/memo/$(date +%Y%m%d).md"

# fzf
if [ -f $HOME/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# z
if [ -f /usr/local/etc/profile.d/z.sh ]; then
  source /usr/local/etc/profile.d/z.sh
fi

# rbenv
if [ -d $HOME/.rbenv ]; then
  eval "$(rbenv init -)"
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
  eval "$(pyenv init -)"
fi

# nodenv
if [ -d $HOME/.nodenv ]; then
  eval "$(nodenv init -)"
fi

# direnv
eval "$(direnv hook zsh)"

# For local settings
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

# Utilities
function cd() {
  builtin cd $@ && ls;
}

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
