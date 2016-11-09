#!/bin/sh


# setup folder structure
mkdir ~/Documents/workspace
mkdir ~/Documents/repos


# brew setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew install caskroom/cask/brew-cask

# Core utils
brew install coreutils
brew install findutils

# Dependencies
brew install jpeg-turbo
brew install optipng
brew install readline

# Apps
brew install the_silver_searcher
brew install ant
brew install git
brew install mercurial
brew install node
brew install irssi
brew install phantomjs
brew install unrar
brew install trash
brew install tree
brew install wget
brew install tig
brew install ffind
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/vagrant-manager
brew install docker
brew install boot2docker
brew install bash-completion
brew tap homebrew/completions
brew install https://raw.githubusercontent.com/BurntSushi/ripgrep/master/pkg/brew/ripgrep.rb

# MacVim for terminal
brew install macvim --with-cscope --with-lua
brew linkapps macvim
alias vim='mvim -v'

# OSX native apps
brew install caskroom/cask/brew-cask

function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask atom
installcask dropbox
installcask copy
installcask google-chrome
installcask firefox
installcask iterm2

# utils
installcask skype
installcask lastfm
installcask vlc
installcask 1password
installcask camtasia
installcask cleanmymac
installcask macpaw-gemini
installcask flickr-uploadr
installcask spotify
installcask licecap
installcask skitch
installcask slack

#python packages
sudo easy_install pip
sudo pip install pip --upgrade
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install --user git+git://github.com/powerline/powerline


# games
installcask steam


# npm dependencies that I'm not likely to live without
npm install -g jshint
npm install -g jsxhint
npm install -g eslint babel-eslint
npm install -g babel-eslint
npm install -g grunt-cli
npm install -g gulp
npm install -g yo
npm install -g http-server
npm install -g git-bc
npm install -g ntl
npm install -g ipt

# vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Go to bundle folder
cd ~/.vim/bundle/

# Get all plugins
git clone https://github.com/KeitaNakamura/neodark.vim.git
git clone https://github.com/rbgrouleff/bclose.vim
git clone https://github.com/vim-scripts/bufkill.vim
git clone https://github.com/wincent/Command-T.git
git clone https://github.com/tpope/vim-fugitive.git
echo "Command-T will need extra setup, please review its docs"
open https://github.com/wincent/Command-T/blob/master/doc/command-t.txt#L174
git clone https://github.com/rking/ag.vim
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/mitechie/pyflakes-pathogen.git
git clone https://github.com/scrooloose/syntastic.git
echo "Syntastic will rely on code validation tools, such as jshint"
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/twerth/ir_black.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/AndrewRadev/splitjoin.vim.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/ruyadorno/vim-change-indent.git
git clone https://github.com/groenewege/vim-less.git
git clone https://github.com/ap/vim-css-color.git
git clone https://github.com/hail2u/vim-css3-syntax
git clone https://github.com/othree/html5.vim.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/digitaltoad/vim-jade.git
git clone https://github.com/posva/vim-vue.git
git clone https://github.com/isRuslan/vim-es6.git

# Configure Command-T
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make


## Get dotfiles repo
cd ~/Documents/repos/
git clone https://github.com/erickbelfy/dotfiles.git

## Get sexy bash prompt
cd ~/Documents/repos/
git clone https://github.com/twolfson/sexy-bash-prompt.git
cd ~/Documents/repos/sexy-bash-prompt/
make install


## Setup symlinks
cd ~/
ln -s Documents/repos/dotfiles/bashrc .bash_profile
ln -s Documents/repos/dotfiles/eslintrc .eslintrc
ln -s Documents/repos/dotfiles/gitconfig .gitconfig
ln -s Documents/repos/dotfiles/gitignore_global .gitignore_global
ln -s Documents/repos/dotfiles/hgrc .hgrc
ln -s Documents/repos/dotfiles/vimrc .vimrc


# Set bash as default shell
chsh -s /bin/bash

## Casks that needs password permission
installcask private-internet-access

