#
# ~/.bashrc
#

# custom bash
if [[ -e "~/.config/ohmyposh/*.json" ]] then
    eval "$(oh-my-posh init bash --config ~/.config/ohmyposh/theme.json)"
else
    echo "No config found -- oh-my-posh" 2>
fi

if [ -e .bash_aliases ] ; then
    source .bash_aliases
fi

shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

