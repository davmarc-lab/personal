# standard alias for list direcotories
alias ll="ls -la"
alias la="ls -l"
alias l="ls"

# alias for generating a formatting config for clangd, clangd mason formatter required
alias clangd-format="~/.local/share/cvim/mason/bin/clang-format"

alias hpc="source /etc/profile ; cd ~/Documents/HighPerformance/"

alias cg2="cd ~/Documents/ComputerGraphics/CG-Project2/ && 
    alias CompileDoc='doxygen 2> tmp.txt &&
    sed -E '\''s/.*?include//'\'' tmp.txt > warnings.txt &&
    rm tmp.txt' && 
    alias SyncDoc='cp -r ./doc/html/* ~/Documents/ComputerGraphics/cg2-doc/' &&
    cvim ."

alias leet="cd ~/Public/leet/"

# starts docker service
alias dkstart="sudo systemctl start docker"

# stop docker service
alias dkstop="sudo systemctl stop docker.socket"

# pacman update
alias pac-update="sudo pacman -Syu ; echo \"--- Pacman packages updated ---\""

# yay update
alias yay-update="yay -Syu ; echo \"--- Yay packages updated ---\""

# full system update
alias full-update="sudo pacman -Syu ; yay -Syu ; echo \"--- Full system update completed ---\""

# neovim for coding
alias lvim='NVIM_APPNAME="lvim" nvim'

# neovim for coding
alias cvim='NVIM_APPNAME="cvim" nvim'

# testing configurations
# alias tvim='NVIM_APPNAME="tvim" nvim'

# --- custom functions ---

###
# Clone a repository using ssh with the given repo name. If the username is not specified
# it tries to query user.username (set manually) from '.gitconfig'.
###
sgc () {
    if [[ $# -eq 0 ]]; then
        echo "No repo cloned..."
        return 1
    fi

    if [[ $# -eq 2 ]]; then
        link="git@github.com:${1}/${2}.git"
    elif [[ $# -eq 1 ]]; then
        link="git@github.com:$(git config --global --get user.username)/${1}.git"
    fi

    echo "Link => ${link}"
    git clone "${link}"
}

###
# Clone a repository using https with the given username and repo name.
###
gc () {
    if [[ $# -eq 0 ]]; then
        echo "No repo cloned..."
        return 1
    fi

    if [[ $# -eq 2 ]]; then
        link="https://github.com/${1}/${2}.git"
    fi

    echo "Link => ${link}"
    git clone $link
}

