# zplug
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "olivierverdier/zsh-git-prompt", as:plugin
zplug "modules/completion", from:prezto
zplug "modules/history", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/prompt", from:prezto
zplug load

# prezto
if [[ -s "${ZPLUG_REPOS}/sorin-ionescu/prezto/init.zsh" ]]; then
  source "${ZPLUG_REPOS}/sorin-ionescu/prezto/init.zsh"
fi

# zsh-git-prompt
if [[ -s "${ZPLUG_REPOS}/olivierverdier/zsh-git-prompt/zshrc.sh" ]]; then
  source "${ZPLUG_REPOS}/olivierverdier/zsh-git-prompt/zshrc.sh"
fi

# Environment variables
export HISTFILE=~/.zsh_history
export HISTSIZE=30000
export SAVEHIST=30000
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GREP_OPTIONS='--color=auto'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/bin
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export VISUAL='less'
export PAGER='less'
export EDITOR='vim'

# %n: username
# %m: hostname
# %y: tty name
# %~: current directory
# %B..%b: bolding ..
# %F..%f: coloring .. foreground
# %? : return value of previous command
export PROMPT="
%n@%m(%y): %F{magenta}%B%~%b%f
%(?.%F{green}${1:-$}%f.%F{red}${1:-$}%f) "
export RPROMPT='$(git_super_status)'

# Environment variables for zsh-git-prompt
export ZSH_THEME_GIT_PROMPT_PREFIX=""
export ZSH_THEME_GIT_PROMPT_SUFFIX=""
export ZSH_THEME_GIT_PROMPT_SEPARATOR=" | "
export ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
export ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{+%G%}"
export ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
export ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
export ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
export ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
export ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
export ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# Aliases
alias ls="ls -G"
alias ll="ls -alG"
alias h='echo "$(hostname) ($(hostname -i))"'

# History with fzf
function select-history() {
  # -i: Case-insensitive match
  BUFFER=$(history -n -r 1 | $HOME/.fzf/bin/fzf --reverse --no-sort -i --exact --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z
[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh

# rbenv
eval "$(rbenv init -)"

# nodenv
eval "$(nodenv init -)"

# direnv
eval "$(direnv hook zsh)"

# ssh-add
# ssh-add -K ~/.ssh/id_rsa

# Utilities
function cd() {
  builtin cd $@ && ls;
}

# For local settings
[ -f ~/.zshrc_local ] && source ~/.zshrc_local
