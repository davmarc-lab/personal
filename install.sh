#!/bin/bash

MISSING_ARGS=1
GENERIC_ERROR=2

ELEM_NOT_FOUND=3

# Prints on stderr
function err () {
    >&2 echo $@
}

read -r -p "Do you want to update the system first? [Y/n] " response
response=${response,,}
if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
    echo 'Start system update ...'
    sudo pacman -Syu --noconfirm
    if [[ $? > 0 ]] then
        err 'System update failed -- quitting ...'
        exit $GENERIC_ERROR
    fi
    echo 'System update completed'
else
    echo '-- skypping system update --'
fi

# install basic packages
echo 'Installing basic packages'
sudo pacman -S --needed --noconfirm - < 'env/pkglist.txt'
if [[ $? > 0 ]] then
    err 'Failed to install packages -- quitting ...'
    exit $GENERIC_ERROR
fi

# install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin/

# prepare bash files
cp env/bash/.bash_aliases $HOME
cp env/bash/.bash_logout $HOME
cp env/bash/.bash_profile $HOME
cp env/bash/.bashrc $HOME

source $HOME/.bash_profile
source $HOME/.bashrc

./config-install.sh

GIT_EMAIL="davide.marchetti6@studio.unibo.it"
GIT_NAME="Davide Marchetti"

# generate ssh key for github
echo '-- generating ssh key for github --'
ssh-keygen -t ed25519 -C "$GIT_EMAIL"

echo '-- setting up git config user.email and user.name globally --'
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

echo 'AUR package manager'
read -r -p "Do you want to install yay? [Y/n] " response
response=${response,,}
if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
    if [[ ! -e $HOME/git-packages ]] then
        mkdir $HOME/git-packages
    fi
    OLDPWD=`pwd`
    cd $HOME/git-packages && git clone https://aur.archlinux.org/yay.git && \
        cd yay
    makepkg -si
    ERR=$?
    if [[ $? > 0 ]] then 
        err "'makepkg' failed with code $ERR"
        exit $ERR
    fi
    # yay first use
    yay -Y --gendb
    echo '-- yay db generated --'
    yay -Syu --devel
    echo '-- yay devel updated --'
    yay -Y --devel --save
    echo '-- yay devel saved --'
fi
