# ----------------
# Aliases
# ----------------
alias r=rails
alias h="history 1"
alias javac="javac -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias sl="ssh mog@49.212.179.202 -p 30022"
alias ll="ls -al"
alias jman="/usr/local/bin/jman"
alias doku="cd /Library/WebServer/Documents/dokuwiki"

# ------------------------------
# environment variables
# ------------------------------
export LANG=ja_JP.UTF-8
export KCODE=u           # KCODEにUTF-8を設定
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/Applications/android-sdk/platform-tools
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
eval "$(rbenv init -)" # rbenv

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt prompt_percent    # PROMPT内で「%」文字から始まる置換機能を有効にする。
setopt transient_rprompt # コピペしやすいようにコマンド実行後は右プロンプトを消す

# ------------------------------
# completion
# ------------------------------
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

# ------------------------------
# history
# ------------------------------
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
function history-all { history -E 1 } # すべてのヒストリを表示する

# ------------------------------
# prompt
# ------------------------------
# プロンプトに色を付ける
autoload -U colors; colors

prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

PROMPT=$prompt    # 通常のプロンプト
PROMPT2=$prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$rprompt  # 右側のプロンプト
SPROMPT=$sprompt  # スペル訂正用プロンプト

# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# ------------------------------
# vcs
# ------------------------------
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# RPROMPT="%1(v|%F{green}%1v%f|)"


# ------------------------------
# Other Settings
# ------------------------------

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}

# カレントディレクトリの表示
case "$TERM" in
  xterm*|kterm*|rxvt*)
    PROMPT=$(print "%B%{\e[34m%}%m:%(5~,%-2~/.../%2~,%~)%{\e[33m%}%# %b")
    PROMPT=$(print "%{\e]2;%n@%m: %~\7%}$PROMPT") # title bar
    ;;
  *)
    PROMPT='%m:%c%# '
    ;;
esac
