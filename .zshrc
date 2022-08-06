alias ll="exa --tree --level=1"
alias gtp="cd ~/Projects/"

alias gsundo="git reset HEAD~1"
alias ghundo="git reset --hard HEAD~1"
alias gs="git status"

alias sovs="echo 'sourcing ~/.zshrc' && source ~/.zshrc"
alias goodmorning="open /Applications/Things3.app && open /Applications/Slack.app && zh && open ~/Desktop/Brain\ FM\ Player.app && dbe"
alias vimconfig="nvim ~/.config/nvim/init.vim"
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
