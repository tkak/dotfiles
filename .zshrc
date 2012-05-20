# environment variable configuration
#
export MANPATH=/usr/local/lib:xport:$MANPATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export LANG=ja_JP.UTF-8

case "${OSTYPE}" in
# Mac(Unix)
darwin*)
  export PYTHONPATH=/Users/tkak/sandbox/gae/bin:/usr/local/lib:$PYTHONPATH
  source /Users/tkak/.pythonbrew/etc/bashrc
  export WORKON_HOME=$HOME/.virtualenvs
  source `which virtualenvwrapper.sh`
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls="ls -G"
  ;;  
# linux
linux*)
  # ls for linux (FSF)
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  alias ls="ls --color"
  ;;  
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

# autocomplete configuration (zsh standard)
#
autoload -U compinit
compinit

# history configuration
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_dups  # 重複するコマンドは無視する
setopt share_history     # コマンド履歴ファイルを共有する
setopt extended_history  # 履歴ファイルに時刻を記録

## Default shell configuration
#
# set prompt
#
#通常のプロンプト
#PROMPT="%n@${HOST%%.*}%%" 
#プロンプトの右側
#RPROMPT="[%~]" 
#入力ミスを確認する場合に表示されるプロンプト
#SPROMPT="%r is correct? [n,y,a,e]: " 
autoload colors
colors
case ${UID} in
0)
  #PROMPT="%B%{^[[31m%}%/#%{^[[m%}%b  "
  PROMPT="%n@${HOST%%.*}%% " 
  PROMPT2="%B%{[31m%}%_#%{[m%}%b "
  RPROMPT="[%~]" 
  SPROMPT="%B%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%n@${HOST%%.*}%% " 
  PROMPT2="%{^[[31m%}%_%%%{^[[m%} "
  RPROMPT="[%~]" 
  SPROMPT="%r is correct? [n,y,a,e]: " 
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
  ;;
esac 

# カッコの対応などを自動的に補完
setopt auto_param_keys

# Keybind configuration (emacs like)
#
bindkey -e

# rm -i
alias rm='rm -i'
# ls
alias ll='ls -l'
alias la='ls -a'
# df
alias dh='df -h'
# du
alias dsh='du -sh'

#補完候補一覧のカラー表示
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
