My dotfiles
===========

    $ test -d ~/git && mkdir ~/git
    $ cd ~/git
    $ git clone https://github.com/tkak/dotfiles.git
    $ for dotfile in (.zshrc .vim .vimrc .tmux.conf); do ln -sf ~/git/dotfiles/$dotfile ~/$dotfile; done

vim 
---
## setup

    $ cd $HOME/.vim/bundle
    $ git clone https://github.com/Shougo/neobundle.vim.git
    $ vim .vimrc
    :NeoBundleInstall!

tmux
----
## setup
Install iTerm2  
<http://www.iterm2.com/#/section/home>
- Go to the iTerm Preferences -> General -> Selection 
- Enable "Allow clipboard access to terminal apps"

## tips

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
## setup

    $ finger $USER
    $ chsh -s `which zsh`
    $ finger $USER

