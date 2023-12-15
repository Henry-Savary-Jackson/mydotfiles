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

#link doas config
ln -sf $(pwd)/doas.conf /etc/doas.conf
chown root:root doas.conf
chmod 644 doas.conf

cp -f $(pwd)/dwm.desktop /usr/share/xsessions/dwm.desktop
chown root:root dwm.desktop 
chmod 644 doas.conf
#
for file in $(pwd)/programs/*
do
  ln -sf $file /usr/bin/
  chmod 775 $file
done

# change owner of these important files to root
chown root:root programs/lock 

chown root:root programs/locker


ln -sf $(pwd)/sleep_cmds /usr/lib/systemd/system-sleep

ln -sf $(pwd)/backlight.rules /etc/udev/rules.d/


# removes vi and vim to instead use neovim (https://neovim.io/)
rm /usr/bin/vi
rm /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
ln -s /usr/bin/nvim /usr/bin/vim

