#!/bin/bash

#lets check does vim exist, if no - install it:

SCRIPT_PATH=$(pwd)

TMUX_PLUGIN_DIR=~/.tmux/plugins
TMUX_TPM_DIR=$TMUX_PLUGIN_DIR/tpm

InstallPipAppIfNotExist () {
	if [ $(pip list |grep -c $1) -eq 0 ]; then
		sudo -E pip install $1
	fi
}

InstallIAptAppIfNotExists () {

	if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
  		sudo apt -y install $1
	fi
}

InstallAppIfNotExists () {
	
	#if Ubuntu:
	InstallIAptAppIfNotExists $1

}

#install manager and editor
InstallAppIfNotExists vim
InstallAppIfNotExists tmux

#and add packets for getting environment for plugins
InstallAppIfNotExists build-essential
InstallAppIfNotExists cmake
InstallAppIfNotExists python-dev
InstallAppIfNotExists python3-dev
InstallAppIfNotExists python-pip

InstallPipAppIfNotExist leveldb
InstallPipAppIfNotExist clang
InstallPipAppIfNotExist ez-setup
InstallPipAppIfNotExist ctrlk


#this script install all config files into user
cp -v vimrc ~/.vimrc

VUNDLE_PATH=~/.vim/bundle/Vundle.vim
if [ ! -d "$VUNDLE_PATH" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH 
fi


vim +PluginInstall +qall

YOU_COMPLETE_ME=~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so

if [ ! -f "$YOU_COMPLETE_ME" ]; then
	cd ~/.vim/bundle/YouCompleteMe/
	./install.py --clang-completer

	cd $SCRIPT_PATH
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
