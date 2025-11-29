#
# ~/.bashrc
#

# custom bash
if [ -e $HOME/.bash_aliases ] ; then
    source $HOME/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

