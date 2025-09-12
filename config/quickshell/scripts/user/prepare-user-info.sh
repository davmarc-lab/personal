#!/bin/bash

DIR="$HOME/.cache/quickshell/quickshell/user/"

CONFIG_FILE="user.ini"

if [[ ! -e $DIR ]] then
    mkdir $DIR
fi

if [[ ! -e $DIR$CONFIG_FILE ]] then
    touch $DIR$CONFIG_FILE
fi

source <(grep = $DIR/$CONFIG_FILE)

if [[ -z "${user}" ]] ; then
    echo "user=\"$USER\"" > $DIR$CONFIG_FILE
fi

echo $user
