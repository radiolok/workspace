#!/bin/bash

#lets check does vim exist, if no - install it:

TMUX_PLUGIN_DIR=~/.tmux/plugins
TMUX_TPM_DIR=$TMUX_PLUGIN_DIR/tpm
if ! which vim; then
    sudo apt -y install vim
fi

if ! which tmux; then
    sudo apt -y install tmux 
fi

#this script install all config files into user
cp -v vimrc ~/.vimrc

VUNDLE_PATH=~/.vim/bundle/Vundle.vim
if [ ! -d "$VUNDLE_PATH" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH 
	vim +PluginInstall +qall
fi


#copy tmux.conf config file

cp -v tmux.conf ~/.tmux.conf

if [ ! -d "$TMUX_PLUGIN_DIR" ]; then
	mkdir $TMUX_PLUGIN_DIR

fi

if [ ! -d "$TMUX_TPM_DIR" ]; then
	git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIR

fi

tmux source ~/.tmux.conf
