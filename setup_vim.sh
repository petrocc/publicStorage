#!/bin/bash

if ! [[ -e vimrc ]]; then
  echo "Can't find vimrc. Exiting"
  exit 1
fi


if [[ -e ~/.vimrc ]]; then 
  echo "moving out the old .vimrc:" 
  mv ~/.vimrc ~/.vimrc.old
else
  echo "No old vimrc to move"
fi

echo "copying in the .vimrc file:" 
cp vimrc ~/.vimrc

echo "making temp directories:"
mkdir -vp ~/.vim/temp
mkdir -vp ~/.vim/backup
mkdir -vp ~/.vim/colors
curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim > ~/.vim/colors/solarized.vim

if [[ $? -eq 0 ]]; 
then
    sed -i -e  's/\" colorscheme/colorscheme/' ~/.vimrc
else
    echo "Couldn't grab the Solarized color scheme for VIM, not configuring"
fi

# Set up vim autoload plugins:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
