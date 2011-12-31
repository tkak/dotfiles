#########################################
# environment variable
#########################################
PATH=$PATH
MANPATH=/usr/local/lib:xport:$MANPATH
LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH MANPATH LD_LIBRARY_PATH PKG_CONFIG_PATH
# Language setting
LANG=ja_JP.UTF-8
export LANG

case "${OSTYPE}" in
# Mac(Unix)
darwin*)
  export PYTHONPATH=/Users/tkak/sandbox/gae/bin:/usr/local/lib:$PYTHONPATH
  source /Users/tkak/.pythonbrew/etc/bashrc
  #gvim
  #alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
  export DYLD_LIBRARY_PATH=/Users/takaaki/opencv/lib:/usr/local/lib:$DYLD_LIBRARY_PATH
  ;;  
# linux
linux*)
    # ここに設定
  ;;  
esac

#########################################
# autocomplete setting
#########################################
# zsh standard
autoload -U compinit
compinit

#########################################
# history setting
#########################################
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# 重複するコマンドは無視する
setopt hist_ignore_dups  
# コマンド履歴ファイルを共有する
setopt share_history     
# 履歴ファイルに時刻を記録
setopt extended_history  

#########################################
# prompt setting
#########################################
#通常のプロンプト
PROMPT="%n%% " 
#プロンプトの右側
RPROMPT="[%~]" 
#入力ミスを確認する場合に表示されるプロンプト
SPROMPT="%r is correct? [n,y,a,e]: " 
#case ${UID} in
#0)
#    PROMPT="%B%{^[[31m%}%/#%{^[[m%}%b "
#    PROMPT2="%B%{^[[31m%}%_#%{^[[m%}%b "
#    SPROMPT="%B%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
#    ;;
#*)
#    PROMPT="%{^[[31m%}%/%%%{^[[m%} "
#    PROMPT2="%{^[[31m%}%_%%%{^[[m%} "
#    SPROMPT="%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%} "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
#    ;;
#esac 

#########################################
# color setting
#########################################
# ls for FreeBSD
export LSCOLORS=gxfxcxdxbxegedabagacad
# ls for linux (FSF)
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -G"
alias gls="gls --color"
#補完候補一覧のカラー表示
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

#########################################
# other setting
#########################################
# cdのタイミングで自動的にpushd
setopt auto_pushd
# ビープ音をならさないようにする
setopt no_beep
# カッコの対応などを自動的に補完
setopt auto_param_keys

# Keybind設定(emacs like)
bindkey -e

#rm -i
alias rm='rm -i'

#mysql
#alias mysql=/usr/local/mysql/bin/mysql
#alias mysqladmin=/usr/local/mysql/bin/mysqladmin
