# dotfiles
Dotfiles used for configuring my work environment. 

## Installing dotfiles onto a new system
All of this is stolen from [The best way to store your dotfiles](https://www.atlassian.com/git/tutorials/dotfiles). 

If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

- Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:
```bash
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

- And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
```bash
echo "dotfiles" >> .gitignore
```

- Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
```bash 
git clone --bare <git-repo-url> $HOME/dotfiles
```

- Checkout the actual content from the bare repository to your $HOME:
```bash
config checkout
```

- The step above might fail with a message like: 
```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:
```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

- Re-run the checkout if you had problems: 
```bash 
config checkout
```

- Set the flag showUntrackedFiles to no on this specific (local) repository:
```bash 
config config --local status.showUntrackedFiles no
```
