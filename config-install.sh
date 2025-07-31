#!/bin/bash

MISSING_ARGS=1
GENERIC_ERROR=2

ELEM_NOT_FOUND=3

# Prints on stderr
function err () {
    >&2 echo $@
}

if [[ ! -e $HOME/.config ]] then
    mkdir $HOME/.config
fi

if [[ $# < 1 ]] then
    # only visual effect
    echo "-- listing all config modules"
    ls -A -d -1 config/*
    MODULES=`ls -A -d -1 config/*`
    read -r -p "Do you want to install all config modules (total = $(ls -A -d -1 config/* | wc -l))? [Y/n]" response
    response=${response,,}
    if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
        echo "Copying configs:"
    else
        echo "You can call this script passing a module list that will be installed -- skipping"
    fi
else
    DST=$HOME/.config
    for mod in $@
    do
        elem=`ls -A -d -1 config/* | sed "s/.*\///" | grep -w $mod`
        # elem=`ls -A -d -1 config/* | sed "s/.*\///" | sed "s/-//" | grep -w $mod`
        for found in $elem
        do
            read -r -p "-- install '$found'? [Y/n]" response
            response=${response,,}
            if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
                echo "Installing '$found' in $DST/$found"
                rm -rf $DST/$found
                cp -r config/$found $DST/$found
            fi
        done

    done
fi

