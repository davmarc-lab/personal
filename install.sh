#!/bin/bash

MISSING_ARGS=1
GENERIC_ERROR=2

ELEM_NOT_FOUND=3

# Prints on stderr
function err () {
    >&2 echo $@
}

# read -r -p "Do you want to update the system first? [Y/n]" response
# response=${response,,}
# if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
#     echo 'Start system update ...'
#     sudo pacman -Syu --noconfirm
#     if [[ $? > 0 ]] then
#         err 'System update failed -- quitting ...'
#         exit $GENERIC_ERROR
#     fi
#     echo 'System update completed'
# else
#     echo '-- skypping system update --'
# fi
#
# # install basic packages
# echo 'Installing basic packages'
# sudo pacman -S --needed --noconfirm - < 'env/pkglist.txt'
# if [[ $? > 0 ]] then
#     err 'Failed to install packages -- quitting ...'
#     exit $GENERIC_ERROR
# fi

# install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin/

# prepare bash files
# cp env/bash/* $HOME
source $HOME/.bash_profile
source $HOME/.bashrc

./config-install.sh
