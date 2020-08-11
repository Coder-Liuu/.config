# dwm_bar
Inspired by joestandring dwm_bar

## Installation
1. Clone repository:
```
$ git clone https://github.com/Anton-Augustsson/dwm_bar.git ~/.config/dwm_bar
```

2. Make the script executable
```
$ chmod +x  ~/.config/dwm_bar/dwm_bar.sh
```

3. Auto start script by adding line in ~/.xinit
Remember that every line after exec will be ignore. So have status bar before dwm.
```
# Statusbar
/home/$USER/.config/dwm_bar/dwm_bar.sh &

# Start dwm
exec dwm
```
