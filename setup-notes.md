# Setup Notes Manjaro 

Desktop environment: xfce with i3 as window manager. 

## Configurations
- xrandr: used for configuring screen output. For changes to persist they should be made in `$HOME/.xprofile`. I used this for setting the refresh rate to 144hz.
- .config/alacritty/...: file created for configuration of alacritty.
- zsh-syntax-highlighting: to enable zsh syntax highlighting i've followed the instructions here: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
- p10k: the powerline used for the prompt. p10k can be ran to configure it; settings are saved in `.p10k.zsh` which has also been committed. For some reason i had to install it again via `yay`... 

## Software 
- yay: AUR helper that helps managing dependencies etc. from programs installed from the user repository. I used this for installing spotify: `yay -S spotify` [0]. 
- firefox: i've downloaded firefox and replaced palemoon in '~/.i3/config' to open on mod+f2
- alacritty: i've downloaded alacritty for true tone support & replaced it in the i3 config to open  it on mod+enter.
- github-cli: had to install this via `yay -S github-cli` in order to login to github. 

## Dependencies
- pulseaudio-bluetooth: had to install it via pamac. Was needed before i could connect to my sony wh-1000xm3 for some reason. 


## Sources
- [0] https://medium.com/@wardbox/a-simple-manjaro-i3-setup-39b652b6a607
