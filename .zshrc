case "${OSTYPE}" in
# Mac(Unix)
darwin*)
  export MANPATH=/usr/local/lib:$MANPATH
  export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
  homebrew=/usr/local/bin
  rbenv=$HOME/.rbenv/bin
#  phpenv=$HOME/.phpenv/bin
#  cabal=$HOME/.cabal/bin
  export PATH=$homebrew:$rbenv:$cabal:$PATH
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export LANG=ja_JP.UTF-8
  alias ls="ls -G"
  source ~/perl5/perlbrew/etc/bashrc
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
  eval "$(rbenv init - zsh)"
#  eval "$(phpenv init - zsh)"
  ;;  
# linux
linux*)
  # ls for linux (FSF)
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  alias ls="ls --color"
  PATH=$PATH:$HOME/tools/vim73/bin
  ;;  
esac

setopt auto_cd # auto change directory
setopt auto_pushd # auto directory pushd that you can get dirs list by cd -[tab]
setopt correct # command correct edition before each completion attempt
setopt list_packed # compacked complete list display
setopt noautoremoveslash # no remove postfix slash of command line
setopt nolistbeep # no beep sound when complete list displayed
autoload -U compinit # autocomplete configuration (zsh standard)
compinit

# history configuration
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_dups  # 重複するコマンドは無視する
#setopt share_history     # コマンド履歴ファイルを共有する
setopt extended_history  # 履歴ファイルに時刻を記録

## Default shell configuration
#
# set prompt
#
autoload -U colors
colors
_rootprompt="%n@${HOST%%.*}%(?@ o @ x )# "
_prompt="%n@${HOST%%.*}%(?@ o @ x )$ "
_prompt2="%{%}%_: "
_rprompt="[%~]"
_sprompt="%r is correct? [n,y,a,e]: " 
case ${UID} in
0)
  PROMPT="%{$fg[red]%}$_rootprompt"
  PROMPT2="%{$fg[red]%}$_prompt2"
  RPROMPT="%{$fg[white]%}$_rprompt" 
  SPROMPT="%{$fg[green]%}$_sprompt"
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{$fg[blue]%}[s]$_rootprompt"
  ;;
*)
  PROMPT="%{$fg[magenta]%}${_prompt}"
  PROMPT2="%{$fg[magenta]%}$_prompt2"
  RPROMPT="%{$fg[white]%}$_rprompt" 
  SPROMPT="%{$fg[yellow]%}$_sprompt"
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{$fg[cyan]%}[s]$_prompt"
  ;;
esac 

setopt auto_param_keys # カッコの対応などを自動的に補完

# Keybind configuration (emacs like)
#
bindkey -e

alias rm='rm -i'
alias ll='ls -l'
alias la='ls -a'
alias dh='df -h'
alias dsh='du -sh'
alias gs='git status'
alias be='bundle exec'

#補完候補一覧のカラー表示
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

