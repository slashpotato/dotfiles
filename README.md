# slashpotato's bspwm/herbsluftwm dotfiles

### What you'll need
- `bspwm` or/and `herbsluftwm`
- `sxhkd` for hotkeys
- `feh` for wallpaper
- `polybar` for bar
- `picom` as compositor
- `kitty` as terminal 

`~/Pictures/wallpaper.png` is your wallpaper file
 
`unzip rofi kitty sxhkd bspwm/herbslutwm feh polybar picom stow bat oh-my-posh fastfetch fzf zoxide thefuck playerctl` as dependencies

sdkman, brew, oh-my-zsh will be installed if not found in your system by running install script.

! it wont install packages !
## Installation
```
cd ~
git clone https://github.com/slashpotato/dotfiles
cd dotfiles
./install.sh
```

to update, run install.sh from cloned directory again. if theres update, it'll download it

P.S. `startx` is configured to run `compiz`, edit it to run `bspwm` or `herbsluftwm` if you dont have session manager
