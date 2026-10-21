#!/usr/bin/env bash

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

function install () {
    if [[ $# -eq 1 ]] then
        elem=$1
        echo "Installing '$elem' in $DST/$elem"
        rm -rf $DST/$elem
        echo "-- old config in '$DST/$elem' removed --"
        cp -r config/$elem $DST/$elem
        echo -e "-- new config copied in '$DST/$elem'\n"
    fi
}


# If a file is passed it checks if it exists and start querying the given configs.
# If the file doesn't exists it recalls itself without parameters and fallback to `all`.
if [[ $1 == "modules.txt" ]] then
    res=`find $1 2> /dev/null`
    if [[ $? -eq 0 ]] then
        for config in `cat modules.txt`
        do
            read -r -p "-- install '$config'? [Y/n] " response
            response=${response,,}
            if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
                install "$config"
            fi
        done
        echo -e "\nFinished copying configs\n"

        exit 0
    fi
    # file given not found
    err "$1 was not found -- falling back to \`all\`"
    ./config-install.sh
    exit $?
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
            install "$elem"
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
                    install "$found"
                fi
            done
        fi
    done
fi

if [[ $# < 1 ]] then
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
fi

echo -e "\nFinished copying configs\n"
