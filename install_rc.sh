#!/bin/bash

#lets check does vim exist, if no - install it:

SCRIPT_PATH=$(pwd)

TMUX_PLUGIN_DIR=~/.tmux/plugins
TMUX_TPM_DIR=$TMUX_PLUGIN_DIR/tpm

InstallPipAppIfNotExist () {
	if [ $(pip list |grep -c $1) -eq 0 ]; then
		sudo -E pip3 install $1
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
InstallAppIfNotExists python3-pip


InstallPipAppIfNotExist leveldb
InstallPipAppIfNotExist clang
InstallPipAppIfNotExist ez-setup
InstallPipAppIfNotExist ctrlk

cp ./vimrc ./vimrc_tmp 
#Got autoindent libclang:
CLANG_LIB_PATH=$(find /usr/lib -name "libclang.so")
if [ ! $CLANG_LIB_PATH ]; then
	CLANG_LIB1_PATH=$(find /usr/lib -name "libclang.so.*")
	if [ $CLANG_LIB1_PATH ]; then
		CLANG_DIR=$(dirname "$CLANG_LIB1_PATH")
		sudo ln -s $CLANG_LIB1_PATH $CLANG_DIR/libclang.so
		sed -i -e "s#libclang_so_path#$CLANG_DIR#" ./vimrc_tmp 
	fi
else
	sed -i -e "s#libclang_so_path#$(dirname "$CLANG_LIB_PATH")#" ./vimrc_tmp
fi

#this script install all config files into user
cp -v vimrc_tmp ~/.vimrc
rm -f vimrc_tmp

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
