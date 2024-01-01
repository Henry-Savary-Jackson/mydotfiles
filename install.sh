#!/bin/sh

shopt -s dotglob
ln -sf $PWD/dotfiles/.* ~/

ln -f $PWD/dotfiles/.gitconfig $PWD/

#add font to system
##if the folders do not exist, make them
if [ ! -d $HOME/.local ]; then
	mkdir ~/.local
fi

if [ ! -d $HOME/.local/share ]; then 
	mkdir ~/.local/share
fi

if [ ! -d $HOME/.local/share/fonts ] ; then
	mkdir ~/.local/share/fonts
fi
ln -sf $PWD/fonts/* ~/.local/share/fonts/

# kitty config
if [ ! -L $HOME/.config/kitty ] ; then 
  rm -rf $HOME/.config/kitty  
fi
ln -sf $PWD/kitty ~/.config/

# ncurses music player c plus plus
if [ ! -L $HOME/.config/ncmpcpp ] ; then 
  rm -rf $HOME/.config/ncmpcpp  
fi
ln -sf $PWD/ncmpcpp ~/.config/


# link the wallpaper image
ln -sf $PWD/wallpaper.jpg ~/

# zathura config
if [ ! -L $HOME/.config/zathura ] ; then 
  rm -rf $HOME/.config/zathura
fi
ln -sf $PWD/zathura ~/.config/


#VSCodium config
ln -sf $PWD/VSCodium/settings.json ~/.config/VSCodium/User/settings.json
cat $PWD/VSCodium/extensions | xargs -I{} codium --install-extension {}


# simple x hotkey daemon config
if [ ! -L $HOME/.config/sxhkd ] ; then 
  rm -rf $HOME/.config/sxhkd
fi
ln -sf $PWD/sxhkd ~/.config/
 
#turns sound on 
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute

sudo usermod $USER -aG video  

# make sure only root can access github oatuh token
sudo chown root:root ~/.config/gh/hosts.yml

echo awaiting root permissions for following steps
sudo ./root_setup.sh
