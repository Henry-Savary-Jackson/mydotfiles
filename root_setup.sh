if [ $(whoami) != 'root' ]; then
  echo "Must be root to execute"
  exit 1
fi


shopt -s dotglob

ls profile.d | xargs -I{} cp -f  profile.d/{} /etc/profile.d/{}

cp -nf .gitconfig /root/.gitconfig

if [ ! -d /etc/X11/xorg.conf.d ]; then
  mkdir /etc/X11/xorg.conf.d
fi
ls xorg.conf.d | xargs -I{} cp -f  xorg.conf.d/{} /etc/X11/xorg.conf.d/{}


cp -f $PWD/slim/slim.conf /etc/slim.conf
chown root:root slim/slim.conf
chmod 664 slim/slim.conf

ls programs | xargs -I{} cp -f programs/{} /usr/bin/{}

cp -f $PWD/sudo/sudoers /etc/sudoers
chown root:root sudo/sudoers

# change owner of these important files to root
chown root:root programs/lock 
chown root:root programs/locker

cp -f $PWD/picom/picom.conf /etc/xdg/picom.conf

cp -Rf $PWD/slim/customLogin /usr/share/slim/themes/
chmod -R 645 slim/customLogin
chown -R root:root slim/customLogin

ls udevrules | xargs -I{} cp udevrules/{} /etc/udev/rules.d/{}

# removes vi and vim to instead use neovim (https://neovim.io/)
rm /usr/bin/vi
rm /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
ln -s /usr/bin/nvim /usr/bin/vim

