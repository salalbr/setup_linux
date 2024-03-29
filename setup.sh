#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y --force-yes git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y --force-yes rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y --force-yes emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
#cd $HOME
if [ -d $HOME/dotfiles/ ]; then
    mv -v $HOME/dotfiles $HOME/dotfiles.old
fi
if [ -d $HOME/.emacs.d/ ]; then
    mv -v $HOME/.emacs.d $HOME/.emacs.d~
fi
#git clone https://github.com/startup-class/dotfiles.git
cp -a dotfiles $HOME
cd $HOME/
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

