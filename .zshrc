# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tkacloud"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/Users/takaaki.furukawa/.rbenv/shims:/Users/takaaki.furukawa/perl5/perlbrew/bin:/Users/takaaki.furukawa/perl5/perlbrew/perls/perl-5.8.9/bin:/usr/local/bin:/Users/takaaki.furukawa/.rbenv/bin::/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/takaaki.furukawa/.rvm/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
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
  ovftool=/Applications/VMware\ OVF\ Tool
  go=/usr/local/go/bin
  export GOPATH=$HOME/.go
  export PATH=$homebrew:$rbenv:$cabal:$ovftool:$go:$GOPATH/bin:$PATH
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

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
