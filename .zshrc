# MEMO: Load order of zsh files
# 1. /etc/zshenv
# 2. ~/.zshenv
# 3. /etc/zprofile
# 4. ~/.zprofile
# 5. /etc/zshrc
# 6. ~/.zshrc
# 7. /etc/zlogin
# 8. ~/.zlogin

# zplug
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async", from:github
zplug "sorin-ionescu/prezto", from:github
zplug "modules/completion", from:prezto
zplug "sindresorhus/pure", from:github, at:main, as:theme, use:pure.zsh
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

# zsh options
setopt hist_expire_dups_first # 履歴を切り詰める際に、重複する最も古いイベントから消す
setopt hist_ignore_all_dups # 履歴が重複した場合に古い履歴を削除する
setopt hist_ignore_dups # 前回のイベントと重複する場合、履歴に保存しない
setopt hist_ignore_space # 空白から始まるイベントを履歴に保存しない
setopt hist_save_no_dups # 履歴ファイルに書き出す際、新しいコマンドと重複する古いコマンドは切り捨てる
setopt share_history # 全てのセッションで履歴を共有する

# environment variables
# NOTE: ~/.zshenvに書くと後から読み込まれるファイルによって上書きされる場合があり、そういったものは.zshrcに書くようにした
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# aliases
alias ls="ls -G"
alias ll="ls -alG"
alias h='echo "$(hostname) ($(hostname -i))"'
alias vim='nvim'
alias memo="vim ${HOME}/memo/$(date +%Y%m%d).md"
alias memo_path="echo ${HOME}/memo/$(date +%Y%m%d).md"
alias be='bundle exec'
alias tree='tree -a -C'

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

# For local settings
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

# Utilities
function cd() {
  builtin cd $@ && ls;
}

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}

zle -N select-history
bindkey '^r' select-history
