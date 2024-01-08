#########################
# Aliases
#########################
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias bashrc="v ~/.bashrc; source ~/.bashrc; echo 'Sourced Bash Config'"
alias bashaliases="v ~/.bash_aliases; source ~/.bash_aliases; echo 'Sourced Aliases'"
alias tconf="v ~/.tmux.conf; tmux source ~/.tmux.conf; echo 'Sourced Tmux Config'"
alias v="nvim"
