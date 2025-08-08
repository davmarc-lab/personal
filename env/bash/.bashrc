#
# ~/.bashrc
#

# custom bash
if [ -e $HOME/.config/ohmyposh/theme.json ] ; then
    eval "$(oh-my-posh init bash --config ~/.config/ohmyposh/theme.json)"
else
     >&2 echo "No config found -- oh-my-posh"
fi

if [ -e $HOME/.bash_aliases ] ; then
    source $HOME/.bash_aliases
fi

shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

