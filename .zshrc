# TODO: This file is becoming large. 
# I could split it into several smaller files. 
# Perhaps find a way to conditionally toggle manjaro config stuff?
# TODO: put destinations into variables - use them in gd commands 
# This way they can also be used for other stuff (for example jn ml)

# Enable powerline - mac specific
USE_POWERLINE="true"
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

export PS1="%~ 😎👉 "

# General Aliases 
alias ll="exa --tree --level=1"
alias jn="jupyter-notebook ."

## Destination shortcuts
alias gtp="cd ~/Projects/"

# shortcuts for comp sci semester 1 
## Computer Science  
mlcoursepage="https://brightspace.au.dk/d2l/le/lessons/70849/topics/1073537"
dlcoursepage="https://brightspace.au.dk/d2l/le/lessons/71451/units/1050059"
dvcoursepage="https://brightspace.au.dk/d2l/le/lessons/70168/units/1028790"
alias planning-time="open -a /Applications/Firefox.app $mlcoursepage && open -a /Applications/Firefox.app $dlcoursepage && open -a /Applications/Firefox.app $dvcoursepage && open /Applications/Things3.app"
## ML
alias gtml="cd ~/Projects/machine-learning" 
alias gtmlp="cd ~/Projects/machine-learning/ml-group-15" 
alias gtmle="gtml && cd exercise-sessions"
alias gtmla="cd ~/Documents/*'Machine Learning'/"
alias gtmlae="cd '/Users/madsfrederiksen/Documents/🤖 Machine Learning/🧰 Resources/exercise-sets'"
## DV 
alias gtdvp="cd ~/Projects/data-visualization-course-project"
## DL
alias gtdl="cd ~/Projects/deep-learning-for-visual-recognition"
alias gtdlp="cd ~/Projects/deep-learning-for-visual-recognition/course-project"
alias gtdlae="cd '/Users/madsfrederiksen/Documents/👁 Deep Learning for Visual Recognition/🧰 Resources/Deep-Learing-for-Visual-Recognition-2022'"

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

# Open or create new daybook entry TODO: Reconsider date structure
dbe() {
  DATE=$(date "+%d-%m-%Y")
  FILE=~/notes/daybook-${DATE}.md
  cd ~/notes/
  if [[ -f "$FILE" ]]; then 
    nvim ${FILE}
  else
    touch ${FILE} 
    echo "# Daybook entry for ${DATE}" > ${FILE}
    nvim ${FILE}
  fi
}

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

