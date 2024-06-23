#!/bin/bash

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

config_dirs=( $(ls .config ) )
for directory in ${config_dirs[@]} 
do
  if [[ -d ~/.config/$directory && ! -L ~/.config/$directory  ]] ; then 
    rm -rf ~/.config/$directory
  else
    rm ~/.config/$directory
  fi
  ln -sf $PWD/.config/$directory ~/.config/$directory
done


#VSCodium config
cat $PWD/.config/VSCodium/extensions | xargs -I{} codium --install-extension {}

# add pre-commit hook to add extensions
ln -sf $PWD/.config/VSCodium/git-save-vscodium-extension-precomm-hook $PWD/.git/hooks/

# link the wallpaper image
ln -sf $PWD/wallpaper.jpg ~/

#turns sound on 
amixer sset Master unmute 
amixer sset Speaker unmute
amixer sset Headphone unmute

echo awaiting root permissions for following steps
sudo ./root_setup.sh
sudo usermod $USER -aG video  
