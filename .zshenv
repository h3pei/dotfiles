# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# MEMO: PROMPT settings
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

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=30000
export SAVEHIST=30000
export HISTCONTROL=ignoredups:erasedups
export EDITOR='vim'
export PAGER='less'
export VISUAL='less'
export GREP_OPTIONS='--color=auto'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export GOPATH=$HOME/go
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$HOME/bin:$PYENV_ROOT/bin:$GOPATH/bin:/usr/local/sbin:$PATH
