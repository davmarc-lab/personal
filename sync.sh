#!/bin/bash

ELEM_NOT_FOUND=3

# Prints on stderr
function err () {
    >&2 echo $@
}

DST='config'

# Loads the given configuration
function sync_config () {
    # config directory name needed
    if [[ $# != 1 ]] then
        err "Missing config name -- cancel operation"
        return $MISSING_ARGS
    fi
    FILE=$1
    FOUND=`ls -d $HOME/.config/$FILE 2> /dev/null | wc -l`
    if [[ $FOUND -ge 1 ]] then
        echo "($FILE) config found ... copying into '$DST' directory"
        cp -r "$HOME/.config/$FILE" "$DST/"
    else
        echo "($FILE) config not found -- skipping"
        return $ELEM_NOT_FOUND
    fi

}

for fin in `cat modules.txt`
do
    sync_config $fin
done
