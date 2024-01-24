#!/bin/sh

shopt -s dotglob
ln -sf $PWD/dotfiles/.* ~/

ln -f $PWD/dotfiles/.gitconfig $PWD/

#add font to system
##if the folders do not exist, make them
if [ ! -d ~/.local ]; then
	mkdir ~/.local
fi

if [ ! -d ~/.local/share ]; then 
	mkdir ~/.local/share
fi

if [ ! -d ~/.local/share/fonts ] ; then
	mkdir ~/.local/share/fonts
fi
ln -sf $PWD/fonts/* ~/.local/share/fonts/

# kitty config
if [ ! -L ~/.config/kitty ] ; then 
  rm -rf ~/.config/kitty  
fi
ln -sf $PWD/kitty ~/.config/

# music player per user configuration
if [ ! -L  ~/.config/mpd ] ; then
  rm -rf ~/.config/mpd
fi
ln -sf $PWD/mpd ~/.config/

if [ ! -L  ~/.config/dconf ] ; then
  rm -rf ~/.config/dconf
fi
ln -sf $PWD/dconf ~/.config/


# ncurses music player c plus plus
if [ ! -L  ~/.config/ncmpcpp ] ; then 
  rm -rf ~/.config/ncmpcpp  
fi
ln -sf $PWD/ncmpcpp ~/.config/


# link the wallpaper image
ln -sf $PWD/wallpaper.jpg ~/

# zathura config
if [ ! -L ~/.config/zathura ] ; then 
  rm -rf ~/.config/zathura
fi
ln -sf $PWD/zathura ~/.config/


#VSCodium config
ln -sf $PWD/VSCodium/settings.json ~/.config/VSCodium/User/settings.json
cat $PWD/VSCodium/extensions | xargs -I{} codium --install-extension {}


# simple x hotkey daemon config
if [ ! -L ~/.config/sxhkd ] ; then 
  rm -rf ~/.config/sxhkd
fi
ln -sf $PWD/sxhkd ~/.config/
 
#turns sound on 
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute

sudo usermod $USER -aG video  

echo awaiting root permissions for following steps
sudo ./root_setup.sh
