# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path周り
eval "$(sheldon source)"

#文字コード設定
export LANG=ja_JP.UTF-8
export EDITOR=vim
# alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto'
alias l='ls -alF'
alias history='history 1'

# 拡張系
## 選択中の候補を塗りつぶし
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

## 入力ミスの際、似たコマンドの表示
setopt correct

## 履歴周り
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
### 履歴を他のシェルとリアルタイム共有する
setopt share_history
### 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups
### historyに保存するときに余分なスペースを削除する
setopt hist_ignore_space
### historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
### 実行時に履歴をファイルにに追加していく
setopt inc_append_history

## 'cd'の省略
setopt auto_cd
## 補完候補で、大文字・小文字を区別しないで補完出来るようにするが、大文字を入力した場合は区別する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補間候補一覧上で移動できるように
zstyle ':completion:*:default' menu select=1
## 補間候補にカレントディレクトリは含めない
zstyle ':completion:*:cd:*' ignore-parents parent pwd  # 補間候補にカレントディレクトリは含めない

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval source "/opt/homebrew/Cellar/anyenv/1.1.5/libexec/../completions/anyenv.zsh"
eval "$(anyenv init -)"
