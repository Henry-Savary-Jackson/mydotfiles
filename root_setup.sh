if [ $(whoami) != 'root' ]; then
  echo "Must be root to execute"
  exit 1
fi


# this allows for shwoing a mouse inside a qemu vm
if [ ! -d /etc/X11/xorg.conf.d ]; then
  mkdir /etc/X11/xorg.conf.d
fi
echo "putting mouse config"
ln -sf $(pwd)/vesa-swcursor.conf /etc/X11/xorg.conf.d/

# makes a hard link of my passlist shell script to $PATH 
ln -sf $(pwd)/passlist /usr/bin/ 

#link doas config
ln -sf $(pwd)/doas.conf /etc/doas.conf
chown root:root doas.conf
chmod 644 doas.conf
# link my screenshot scrot script
ln -sf $(pwd)/screenshot /usr/bin/

ln -sf $(pwd)/slim.conf /etc/slim.conf
chown root:root slim.conf
chmod 664 slim.conf

ln -sf $(pwd)/lock /usr/bin/
chown root:root lock 
chmod 775 lock

ln -sf $(pwd)/locker /usr/bin/
chown root:root locker 
chmod 775 locker

ln -sf $(pwd)/customLogin /usr/share/slim/themes/
chown -R root:root customLogin
chmod -R 664 customLogin

ln -sf $(pwd)/batteryinfo /usr/bin/batteryinfo

ln -sf  backlight.rules /etc/udev/rules.d/

# removes vi and vim to instead use neovim (https://neovim.io/)
rm /usr/bin/vi
rm /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
ln -s /usr/bin/nvim /usr/bin/vim

