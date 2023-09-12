# Enable powerline 
USE_POWERLINE="true"
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# General Aliases 
alias ll="exa --tree --level=1"
alias jn="jupyter-notebook ."

# git aliases 
alias gsundo="git reset HEAD~1"
alias ghundo="git reset --hard HEAD~1"
alias gs="git status"

# Config aliases 
alias sovs="echo 'sourcing ~/.zshrc' && source ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Other aliases 
alias get-pending-delete-domains="echo https://www.namejet.com/download/$(date +%-m-%d-%Y).txt | xargs curl | nvim"
alias pip-message="echo 'Nope. Use python3 -m pip.'"
alias pip="pip-message"
alias pip3="pip-message"

# Git branch search 
gbs() {
  git branch -a | grep "$1" | fzf --layout reverse-list --header="Select branch" --preview "echo {} | sed 's/ //g' | xargs git log | bat --color=always --theme=gruvbox-dark -p" | xargs git checkout
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '/.' -prune \
                  -o -type d -print 2> /dev/null | fzf +m --preview "exa --icons --tree --level=1 {}") &&
  cd "$dir"
}

# Enable autocompletion in git
autoload -Uz compinit && compinit

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Enable fzf
source ~/.p10k.zsh
source ~/.config/zsh-parts/comp-sci-semester-2

# Add conda to path 
# export PATH="/Users/madsfrederiksen/anaconda3/bin:$PATH"  # commented out by conda initialize

# pnpm
export PNPM_HOME="/Users/madsfrederiksen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/madsfrederiksen/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/madsfrederiksen/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/madsfrederiksen/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/madsfrederiksen/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

