# Enable powerline 
USE_POWERLINE="true"
#source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source ~/.secrets

# General Aliases 
alias ll="exa --tree --level=1"
alias jn="jupyter-notebook ."

alias rip-song="yt-dlp --extract-audio --audio-quality 10 --audio-format wav"

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

# Search and replace string
sars() {
  if [ "$#" -eq 1 ]; then
    search_string=$1
    echo "Searching for files containing \"$search_string\"..."
    find . -type f -exec grep -l "$search_string" {} +
  elif [ "$#" -eq 2 ]; then
    search_string=$1
    replacement_string=$2
    echo "Replacing \"$search_string\" with \"$replacement_string\" in all files..."
    find . -type f -exec sed -i '' "s/$search_string/$replacement_string/g" {} +
  else
    echo "Usage: replace_in_files <search_string> [<replacement_string>]"
    return 1
  fi
}

# Wraps args of previous commands in quotes when you fucking forget it...
fucking() {
  # Get the previous command
  local prev_cmd=$(fc -ln -1)

  # Separate the command from its arguments
  local cmd_name=$(echo "$prev_cmd" | awk '{print $1}')
  local cmd_args=$(echo "$prev_cmd" | awk '{$1=""; print $0}' | sed -E 's/^[ ]+//')

  # Wrap the arguments in quotes, handling flags with values
  local quoted_args=$(echo "$cmd_args" | awk '{
    for(i=1;i<=NF;i++) {
      if($i ~ /^-/) {
        # If the argument is a flag with an "=" sign
        if($i ~ /=/) {
          sub(/=/, "=\"", $i);
          $i=$i"\"";
        }
        printf("%s ", $i);
      } else {
        printf("\"%s\" ", $i);
      }
    }
  }')

  # Combine the command name with the quoted arguments
  local quoted_cmd="$cmd_name $quoted_args"

  # Print the modified command to the current command line buffer
  print -z "$quoted_cmd"}


# Enable autocompletion in git
autoload -Uz compinit && compinit

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Enable fzf
source ~/.p10k.zsh

# Disallow opening a new nvim instance inside a nvim terminal... God knows i've done that one too many times... 
if [[ ! -z "$VIM_TERMINAL" ]]; then
    function nvim() {
        echo "Opening a new instance of Neovim is disabled in this environment."
    }
fi

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

eval "$(zoxide init --cmd cd zsh)"


# Add zodixe: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Run Self Control block 
#sudo /Applications/SelfControl.app/Contents/MacOS/selfcontrol-cli start --enddate "$(date -u -v+24H +"%Y-%m-%dT%H:%M:%SZ")" --blocklist ~/block-list.selfcontrol --uid 501
