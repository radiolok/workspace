#!/bin/bash

#This script takes current system setting, copied it here and does git commit
cp -v ~/.vimrc ./vimrc

git add vimrc
git commit

