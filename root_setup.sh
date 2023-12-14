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

ln -sf $(pwd)/lock /usr/bin/
chown root:root lock 
chmod 775 lock

ln -sf $(pwd)/locker /usr/bin/
chown root:root locker 
chmod 775 locker


cp -f $(pwd)/dwm.desktop /usr/share/xsessions/dwm.desktop
chown root:root dwm.desktop 
chmod 644 doas.conf
#
ln -sf $(pwd)/batteryinfo /usr/bin/batteryinfo

ln -sf $(pwd)/backlight.rules /etc/udev/rules.d/

ln -sf $(pwd)/restartwifi /usr/bin/

# removes vi and vim to instead use neovim (https://neovim.io/)
rm /usr/bin/vi
rm /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
ln -s /usr/bin/nvim /usr/bin/vim

