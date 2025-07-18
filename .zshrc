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

# environment variables
# NOTE: ~/.zshenvに書くと後から読み込まれるファイルによって上書きされる場合があり、そういったものは.zshrcに書くようにした
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export PATH="$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$GOPATH/bin:$PYENV_ROOT/bin:$HOME/.cargo/bin:$HOME/.claude/local/node_modules/.bin:$PATH"

source ~/.zsh_libs
source ~/.zsh_aliases
source ~/.zsh_functions

# For local settings
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
