#!/bin/bash

#this script install all config files into user
cp -v ./vimrc ~/.vimrc

#copy tmux.conf config file

cp -v ./tmux.conf ~/.tmux.conf


tmux source ~/.tmux.conf
