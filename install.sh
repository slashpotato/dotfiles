#!/bin/bash
DOTFILESDIR=$PWD

# symbols and escapes vars
SCS="\e[1;32m✓\e[0m"   # success symbol
WAIT="\e[1;33m~\e[0m"  # processing symbol
WRN="\e[1;33m⚠︎\e[0m"   # warn symbol
ERR="\e[1;31m✘\e[0m"   # fail symbol

LUP='\e[1A'            # line up
CUP='\e[1A\e[K'        # change up

# functions
shprc () {
    echo -e "${WAIT} $*"
}
shscs () {
    echo -e "${SCS} $*"
}
sherr () {
    echo -e "${ERR} $*"
}
shwrn () {
    echo -e "${WRN} $*"
}
shscsl () {
    echo -e "${CUP}${SCS} $*"
}
sherrl () {
    echo -e "${CUP}${ERR} $*"
}
shpause () {
    read -n1 -r -p "ⓘ Press any key to continue..." key
}

# update git
shprc "Fetching repository..."
git fetch &> /dev/null && shscsl "Successfully fetched repository" || sherrl "Error fetching repository"

# download/update submodules
shprc "Updating submodules..."
git submodule update --init --recursive &> /dev/null && shscsl "Successfully updated submodules" || sherrl "Error updating submodules"

# if theres updates in git, download
if git status | grep 'behind' > /dev/null; then
    shprc "Found update, pulling..."
    git pull &> /dev/null && shscsl "Downloaded update" || sherrl "Failed downloading update"
else
    shscs "Your dotfiles are up-to-date"
fi

# install omz if doesnt exist
if [ ! -d $HOME/.oh-my-zsh ]; then
    shwrn "Oh My ZSH not found, installing...\nPlease agree setting zsh as default shell"
    shpause
    cd $HOME
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cd $DOTFILESDIR
fi

# install sdkman if doesnt exist
if [ ! -d $HOME/.sdkman ]; then
    shwrn "SDKMAN not found, installing..."
    shpause
    cd $HOME
    curl -s "https://get.sdkman.io" | bash
    cd $DOTFILESDIR
fi

# install homebrew if doesnt exist
if [ ! -d /home/linuxbrew ]; then
    shwrn "Homebrew not found, installing..."
    shpause
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# setup
stow . -t ~ --adopt --ignore=install.sh &> /dev/null && shscs "Successfully created stow symlinks" || sherr "Error creating stow symlinks"
bat cache --build &> /dev/null && shscs "Successfully built bat cache" || sherr "Error building bat cache"
export BAT_THEME="Catppuccin Mocha"
source "$HOME/.sdkman/bin/sdkman-init.sh"
