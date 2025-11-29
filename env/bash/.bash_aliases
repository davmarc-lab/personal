# standard alias for list direcotories
alias ll="ls -la"
alias la="ls -l"
alias l="ls"

# pacman update
alias pac-update="sudo pacman -Syu ; echo \"--- Pacman packages updated ---\""

# yay update
alias yay-update="yay -Syu ; echo \"--- Yay packages updated ---\""

# full system update
alias full-update="sudo pacman -Syu ; yay -Syu ; echo \"--- Full system update completed ---\""
