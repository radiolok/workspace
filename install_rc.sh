#!/bin/bash

#lets check does vim exist, if no - install it:

SCRIPT_PATH=$(pwd)

TMUX_PLUGIN_DIR=~/.tmux/plugins
TMUX_TPM_DIR=$TMUX_PLUGIN_DIR/tpm

if [ $(dpkg-query -W -f='${Status}' vim 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install vim
fi


if [ $(dpkg-query -W -f='${Status}' tmux 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install tmux 
fi

if [ $(dpkg-query -W -f='${Status}' build-essential 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install build-essential 
fi


if [ $(dpkg-query -W -f='${Status}' cmake 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install cmake 
fi


if [ $(dpkg-query -W -f='${Status}' python-dev 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install python-dev 
fi

if [ $(dpkg-query -W -f='${Status}' python3-dev 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install python3-dev 
fi

if [ $(dpkg-query -W -f='${Status}' python-pip 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt -y install python-pip 
fi

#if [ $(pip list |grep leveldb |wc -l )=0 ];
#then
#  sudo -E  pip install leveldb
#fi

#if [ $(pip list |grep clang |wc -l )=0 ];
#then
#   sudo -E pip install clang
#fi


#if [ $(pip list |grep ez_setup |wc -l )=0 ];
#then
#   sudo -E pip install ez_setup
#fi

#if [ $(pip list |grep ctrlk |wc -l )=0 ];
#then
 #  sudo -E pip install ctrlk
# git clone https://github.com/SkidanovAlex/py-ctrlk.git
#  cd py-ctrlk
#  python setup.py build
#  sudo python setup.py install
#
#fi

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
