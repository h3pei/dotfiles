# MEMO: Load order of zsh files
# 1. /etc/zshenv
# 2. ~/.zshenv
# 3. /etc/zprofile
# 4. ~/.zprofile
# 5. /etc/zshrc
# 6. ~/.zshrc
# 7. /etc/zlogin
# 8. ~/.zlogin

# zinit
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light mafredri/zsh-async
zinit light sorin-ionescu/prezto
zinit light zsh-users/zsh-syntax-highlighting
zinit snippet PZTM::completion # PZTM -> Prezto module

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# pure (zsh theme)
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:path color white
zstyle :prompt:pure:prompt:success color green

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
alias t='tmux'

# fzf
if [ -f $HOME/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# z
if [ -f /usr/local/etc/profile.d/z.sh ]; then
  # Intel Mac
  source /usr/local/etc/profile.d/z.sh
elif [ -f /opt/homebrew/etc/profile.d/z.sh ]; then
  # Apple Silicon Mac
  source /opt/homebrew/etc/profile.d/z.sh
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

# iterm2 shell integrations
# see: https://iterm2.com/documentation-shell-integration.html
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Utilities
function cd() {
  builtin cd $@ && ls;
}

function gd() {
  dir=$(ghq list -p | fzf --query="$1")
  if [ -e "$dir" ]; then
    cd $dir
  fi
}

# see: https://yulii.github.io/brew-cleanup-installed-formulae-20200509.html
function brew-list-unused-formulae() {
  brew list --formulae | xargs -P9 -I{} sh -c 'brew uses --installed {} | wc -l | xargs printf "%20s is used by %2d formulae.\n" {}' | grep ' 0 formulae'
}

function brew-upgrade() {
  brew update -v && brew upgrade -v && HOMEBREW_CLEANUP_MAX_AGE_DAYS=1 brew cleanup -v
}

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}
zle -N select-history

# bindkey
bindkey '^r' select-history
bindkey '^U' backward-kill-line
