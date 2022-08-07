source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias ll="exa --tree --level=1"
alias gtp="cd ~/Projects/"

alias gsundo="git reset HEAD~1"
alias ghundo="git reset --hard HEAD~1"
alias gs="git status"

alias sovs="echo 'sourcing ~/.zshrc' && source ~/.zshrc"
alias goodmorning="open /Applications/Things3.app && open /Applications/Slack.app && zh && open ~/Desktop/Brain\ FM\ Player.app && dbe"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias i3-restart="i3-msg reload && i3-msg restart" # Useful when making changes to i3 config

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

source /home/mads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#in-your-zshrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
