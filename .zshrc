
HISTSIZE=1000000
SAVEHIST=1000000

PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "
export LD_LIBRARY_PATH="/usr/local/bin"

########################################
# 基本機能
# バインドキーをemacsにする
bindkey -e
alias vi='vim'

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

setopt correct
autoload -Uz colors
colors

#source ~/git-completion.zsh
zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

#r#######################################
# 補完ui
# 補完機能を有効にする
autoload -Uz compinit
compinit -u


 #補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

alias -g G='| grep'

# zshを可愛くする
# by http://qiita.com/kubosho_/items/c200680c26e509a4f41c
# プロンプト指定
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-')ノ <!(*;-;%)? <)%{${reset_color}%} "
# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '
# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

########################################
# cool-peco
########################################
function peco_select_from_git_status(){
	git status --porcelain | \
	peco |
	awk -F ' ' '{print $NF}' | \
	tr 'n' ' '
}

function peco_insert_selected_git_files(){
	LBUFFER+=$(peco_select_from_git_status)
	CURSOR= $#LBUFFER
	zle reset-prompt
}

source "$HOME/cool-peco/cool-peco"
zle -N cool-peco-history
bindkey '^r' cool-peco-history
zle -N cool-peco-filename-search
bindkey '^g' cool-peco-filename-search
zle -N cool-peco-git-log
bindkey '^l' cool-peco-git-log
zle -N cool-peco-git-checkout
bindkey '^o' cool-peco-git-checkout
zle -N cool-peco-openfile-vim
bindkey '^v' cool-peco-openfile-vim
zle -N cool-peco-ssh
bindkey '^h' cool-peco-ssh

#zle -N peco_insert_selected_git_files
#bindkey "^a" peco_insert_selected_git_files

zle -N peco_select_from_git_status
bindkey "^t" peco_select_from_git_status

# Ctrl + Sで固まるのを防ぐ

stty stop undef

# SSH接続してgitのpushとかしようとしたら警告出るのを防ぐ
unset SSH_ASKPASS

alias -g V="awk '{print $1 }' | tr -d ':'"

function grep-open-vim() {
  echo -n "(* '-')? < "
  read INPUT
  vim `git grep ${INPUT} | peco | awk -F ':' '{ print $1 }'`
}
