#!/bin/bash

#lets check does vim exist, if no - install it:

if ! which vim; then
    sudo apt -y install vim
fi

if ! which tmux; then
    sudo apt -y install tmux 
fi


#this script install all config files into user
cp -v vimrc ~/.vimrc

#copy tmux.conf config file

cp -v tmux.conf ~/.tmux.conf


tmux source ~/.tmux.conf
