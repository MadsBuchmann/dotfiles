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

# git aliases 
alias gsundo="git reset HEAD~1"
alias ghundo="git reset --hard HEAD~1"
alias gs="git status"

# Config aliases 
alias sovs="echo 'sourcing ~/.zshrc' && source ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Git branch search 
gbs() {
  git branch -a | grep "$1" | fzf --layout reverse-list --header="Select branch" | xargs git checkout
}

# Enable autocompletion in git
autoload -Uz compinit && compinit

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Enable fzf
source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/madsfrederiksen/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/madsfrederiksen/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/madsfrederiksen/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/madsfrederiksen/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

