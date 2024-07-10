#!/bin/bash
DOTFILESDIR=$PWD

# update git, download&update submodules
git fetch &> /dev/null
git submodule update --init --recursive &> /dev/null

# if theres updates in git, download
if git status | grep 'behind' > /dev/null; then
	git pull &> /dev/null
fi

# install omz if doesnt exist
if [ ! -d $HOME/.oh-my-zsh ]; then
	cd $HOME
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cd $DOTFILESDIR
fi

# install sdkman if doesnt exist
if [ ! -d $HOME/.sdkman ]; then
	cd $HOME
	curl -s "https://get.sdkman.io" | bash
	cd $DOTFILESDIR
fi

# install homebrew if doesnt exist
if [ ! -d /home/linuxbrew ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# setup
stow . -t ~ --adopt --ignore=install.sh
bat cache --build &> /dev/null
export BAT_THEME="Catppuccin Mocha"
source "$HOME/.sdkman/bin/sdkman-init.sh"
