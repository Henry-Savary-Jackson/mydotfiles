#!/bin/sh
#make hard links for dotfiles to the home directory
for file in * .[^.]*; do
	if [ -f "$file" ] && [ ${file:0:1} = "." ] && [  $file != ".gitignore" ] ; then  
		if [ -f ../$file ]; then
			rm ../$file
		fi
		ln -sf $PWD/$file ~/$file 
	fi
done


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
cp JetBrainsMonoNerdFont-Regular.ttf ~/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf


# kitty config
if [ ! -L $HOME/.config/kitty ] ; then 
  rm -rf $HOME/.config/kitty  
fi

ln -sf $(pwd)/kitty ~/.config/

# hard link the wallpaper image
ln -f $(pwd)/wallpaper.jpg ~/


if [ ! -L $HOME/.config/zathura ] ; then 
  rm -rf $HOME/.config/zathura
fi
# symbolically link my zathura config folder
ln -sf $(pwd)/zathura ~/.config/


#VSCodium config
ln -sf $PWD/VSCodium/settings.json ~/.config/VSCodium/User/settings.json

extensions=$(cat $PWD/VSCodium/extensions)

for extension_id in $extensions  
do
  echo $extension_id
  codium --install-extension $extension_id
done


if [ ! -L $HOME/.th-client ] ; then 
  rm -rf $HOME/.th-client  
fi
ln -sf $(pwd)/.th-client ~/

if [ ! -L $HOME/.config/sxhkd ] ; then 
  rm -rf $HOME/.config/sxhkd
fi
ln -sf $(pwd)/sxhkd ~/.config/

# setting JAVA_HOME environment variable"
echo "#!/bin/sh
JAVA_HOME='/usr/lib/jvm/default'
export JAVA_HOME"| sudo tee /etc/profile.d/javahome.sh 
 
#allows for sound
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute

sudo usermod $USER -aG video  

sudo chown root:root ~/.config/gh/hosts.yml
echo awaiting root permissions for following steps
sudo ./root_setup.sh
