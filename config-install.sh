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
    echo -e "Missing '.config' directory in '$USER' home -- creating dir\n"
    mkdir $DST
fi

if [[ $# < 1 ]] then
    echo "-- listing all config modules"
    MODULES=`ls -A -d -1 config/*`
    for mod in $MODULES
    do
        echo -e "\t$mod"
    done
    echo ""
    read -r -p "Do you want to install all config modules (total = $(ls -A -d -1 config/* | wc -l))? [Y/n] " response
    response=${response,,}
    if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
        echo -e "Copying configs:"
        for mod in $MODULES
        do
            elem=`sed "s/.*\///" <<< $mod`
            echo "Installing '$elem' in $DST/$elem"
            rm -rf $DST/$elem
            echo "-- old config in '$DST/$elem' removed --"
            cp -r config/$elem $DST/$elem
            echo -e "-- new config copied in '$DST/$elem'\n"
        done
    else
        echo "-- config not imported -- user skip"
    fi
else
    for mod in $@
    do
        echo -e "Fetching '$mod' config"
        elem=`ls -A -d -1 config/* | sed "s/.*\///" | grep -w $mod`
        if [[ $? > 0 ]] then
            echo "-- module named '$mod' not found -- skipping"
        else
            for found in $elem
            do
                read -r -p "-- install '$found'? [Y/n] " response
                response=${response,,}
                if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
                    echo -e "\nInstalling '$found' in $DST/$found"
                    rm -rf $DST/$found
                    echo "-- old config in '$DST/$found' removed --"
                    cp -r config/$found $DST/$found
                    echo -e "-- new config copied in '$DST/$found'\n"
                fi
            done
        fi
    done
fi

echo -e "\nCopying rc files"

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

echo -e "\nFinished copying configs\n"
