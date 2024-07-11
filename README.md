# slashpotato's bspwm dotfiles

### What you'll need
- `bspwm`
- `sxhkd` for hotkeys
- `feh` for wallpaper
- `polybar` for bar
- `picom` as compositor
- `kitty` as terminal 

`~/Pictures/wallpaper.png` is your wallpaper file
 
`kitty sxhkd bspwm feh polybar picom stow bat oh-my-posh fastfetch fzf zoxide thefuck python3 playerctl dbus-python` as dependencies

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

`startx` to start session from tty, or use your display manager
