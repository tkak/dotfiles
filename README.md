My dotfiles
===========

    $ ghq get tkak/dotfiles
    $ ghq look tkak/dotfiles
    $ for dotfile in .zshrc .vim .vimrc .tmux.conf; do ln -sf `pwd`/$dotfile ~/$dotfile; done

Homebrew
--------

    $ brew bundle

vim
---
### setup

    $ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

tmux
----
### setup

Install iTerm2  
<http://www.iterm2.com/#/section/home>
- Go to the iTerm Preferences -> General -> Selection 
- Enable "Allow clipboard access to terminal apps"

### tips

    tmux new -s projectA -- create new session
    Ctrl-b d -- detache
    Ctrl-b s -- choose session
    Ctrl-b , -- rename window
    Ctrl-b c -- create new window
    Ctrl-b n -- switch next window
    Ctrl-b " -- divide window and new session
    Ctrl-b SPACE -- change divided panes at equal spaces
    Ctrl-b :set-window-option synchronize-panes on -- synchronize panes
    Ctrl-b q -- display pane number

zsh
---
### setup

    $ finger $USER
    $ chsh -s `which zsh`
    $ finger $USER


