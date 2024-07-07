#!/bin/bash
DOTFILESDIR=$PWD
git submodule update --init --recursive

if [ ! -d $HOME/.oh-my-zsh ]; then
	cd $HOME
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cd $DOTFILESDIR
fi

stow . -t ~ --adopt
