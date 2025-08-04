#!/bin/bash

MISSING_ARGS=1
GENERIC_ERROR=2

ELEM_NOT_FOUND=3

# Prints on stderr
function err () {
    >&2 echo $@
}
DST=$HOME/.config

if [[ ! -e $DST ]] then
    echo "Missing '.config' directory in '$USER' home -- creating dir"
    mkdir $DST
fi

if [[ $# < 1 ]] then
    # only visual effect
    err "Not working, send a list of configs separated by ' ' -- not implemented"
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
                echo "-- old config in '$DST/$found' removed --"
                cp -r config/$found $DST/$found
                echo "-- new config copied in '$DST/$found'"
            fi
        done
    done
fi

echo "Copying rc files"

FILES=`find config -maxdepth 1 -type f -name "*rc"`
for file in $FILES
do
    file="${file##*/}"
    read -r -p "-- install '$file'? [Y/n] " response
    if [[ $response =~ ^(y| ) ]] || [[ -z $response ]] then
        cp config/$file $DST/$file
        echo "-- copied $file --"
    fi
done

echo ""
echo "Finished copying configs"
echo ""
