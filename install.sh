#!/bin/sh
#make hard links for dotfiles to the home directory
for file in * .[^.]*; do
	if [ -f "$file" ] && [ ${file:0:1} = "." ] && [  $file != ".gitignore" ] ; then  
		if [ -f ../$file ]; then
			rm ../$file
		fi
		ln -f $file ../$file 
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

# hard link the wallpaper image
ln -f $(pwd)/wallpaper.jpg ~/

# symbolically link my zathura config folder
ln -sf $(pwd)/zathura ~/.config/

ln -sf $(pwd)/.vscode-oss ~/

ln -sf $(pwd)/.th-client ~/


ln -sf $(pwd)/sxhkd ~/.config/sxhkd

# setting JAVA_HOME environment variable"
echo "#!/bin/sh
JAVA_HOME='/usr/lib/jvm/default'
export JAVA_HOME"| sudo tee /etc/profile.d/javahome.sh 
 
#allows for sound
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute

sudo usermod $USER -aG video  

echo awaiting root permissions for following steps
sudo ./root_setup.sh
