if [ $(whoami) != 'root' ]; then
  echo "Must be root to execute"
  exit 1
fi


# this allows for shwoing a mouse inside a qemu vm
if [ ! -d /etc/X11/xorg.conf.d ]; then
  mkdir /etc/X11/xorg.conf.d
fi
echo "putting mouse config"
ln -f $(pwd)/vesa-swcursor.conf /etc/X11/xorg.conf.d/

# makes a hard link of my passlist shell script to $PATH 
ln -f $(pwd)/passlist /usr/bin/ 

#link doas config
ln -f $(pwd)/doas.conf /etc/doas.conf
chown root:root doas.conf
chmod 664 doas.conf
# link my screenshot scrot script
ln -f $(pwd)/screenshot /usr/bin/

ln -f $(pwd)/slim.conf /etc/slim.conf
chown root:root slim.conf
chmod 664 slim.conf

# removes vi and vim to instead use neovim (https://neovim.io/)
rm /usr/bin/vi
rm /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
ln -s /usr/bin/nvim /usr/bin/vim

