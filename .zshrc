# Enable powerline 
USE_POWERLINE="true"
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# General Aliases 
alias ll="exa --tree --level=1"
alias jn="jupyter-notebook ."

## Destination shortcuts
alias gtd="cd ~/Developer/"

# shortcuts for comp sci semester 2 
## Computer Science  
alias gtarp="cd ~/Projects/augmented-reality-group"
alias jn-dm-2="jupyter-notebook ~/Developer/data-mining-exercises/group-repo/handin2"

alias nwh="nvim ~/Developer/30x500/action-challenges/where-are-your-audiences-watering-holes/"

# git aliases 
alias gsundo="git reset HEAD~1"
alias ghundo="git reset --hard HEAD~1"
alias gs="git status"

# Config aliases 
alias sovs="echo 'sourcing ~/.zshrc' && source ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias airport='sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'

# Other aliases 
alias get-pending-delete-domains="echo https://www.namejet.com/download/$(date +%-m-%d-%Y).txt | xargs curl | nvim"

# Git branch search 
gbs() {
  git branch -a | grep "$1" | fzf --layout reverse-list --header="Select branch" | xargs git checkout
}

# Enable autocompletion in git
autoload -Uz compinit && compinit

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Enable fzf
source ~/.p10k.zsh


