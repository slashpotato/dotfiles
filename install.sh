#!/bin/bash
DOTFILESDIR=$PWD

git fetch &> /dev/null
git submodule update --init --recursive &> /dev/null

if git status | grep 'behind' > /dev/null; then
	git pull &> /dev/null
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
	cd $HOME
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cd $DOTFILESDIR
fi

if [ ! -d $HOME/.sdkman ]; then
	cd $HOME
	curl -s "https://get.sdkman.io" | bash
	cd $DOTFILESDIR
fi

stow . -t ~ --adopt --ignore=install.sh
fast-theme XDG:catppuccin-mocha &> /dev/null
bat cache --build &> /dev/null
export BAT_THEME="Catppuccin Mocha"
source "$HOME/.sdkman/bin/sdkman-init.sh"
