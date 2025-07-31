#
# ~/.bashrc
#

# custom bash
eval "$(oh-my-posh init bash --config ~/.config/ohmyposh/theme.json)"

if [ -e .bash_aliases ] ; then
    source .bash_aliases
fi

shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

