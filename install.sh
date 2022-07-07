
# This script is ridiculously dangerouse, I take less than 0 responsability if 
# if blows your computer

# Install the alacritty terminal
sudo apt install alacritty

# Install neovim
sudo apt install neovim


# Install awesome WM (window manager) and compton (compositor, allows transparency
# and other fancy stuff)
sudo apt install awesome 
sudo apt install compton


# Copy the configuration files

# Note: you need to add 
#
#	. ~/.bash_files/initialize_bash.sh
#
# to .bashrc for this to work
cp -r files/bash_files ~/.bash_files

cp files/.vimrc ~/.vimrc

mkdir -p ~/.config/alacritty
cp files/alacritty.yml ~/.config/alacritty/alacritty.yml

sudo cp files/rc.lua /etc/xdg/awesome/rc.lua

cp files/xsessionrc ~/.xsessionrc

mkdir -p ~/Pictures/wallpapers/
cp files/backgrounder.py ~/Pictures/wallpapers/backgrounder.py
