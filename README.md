# slashpotato's bspwm dotfiles

### What you'll need
- `bspwm`
- `sxhkd` for hotkeys
- `feh` for wallpaper
- `polybar` for bar
- `picom` as compositor
 
`~/Pictures/wallpaper.png` is your wallpaper file
 
`stow oh-my-posh fastfetch fzf zoxide lsd thefuck xcp python3 playerctl dbus-python` as dependencies
## Installation
```
git clone https://github.com/slashpotato/dotfiles
cd dotfiles
stow . -t ~ --adopt
```

`startx` to start session from tty, or use your display manager
