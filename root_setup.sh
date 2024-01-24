if [ $(whoami) != 'root' ]; then
  echo "Must be root to execute"
  exit 1
fi


shopt -s dotglob

if [ ! -d /etc/X11/xorg.conf.d ]; then
  mkdir /etc/X11/xorg.conf.d
fi
ls xorg.conf.d | xargs -I{} cp -f  xorg.conf.d/{} /etc/X11/xorg.conf.d/{}

cp -f $PWD/sudo/sudoers /etc/sudoers
chown root:root sudo/sudoers

ls udevrules | xargs -I{} cp udevrules/{} /etc/udev/rules.d/{}

# removes vi and vim to instead use neovim (https://neovim.io/)
rm /usr/bin/vi
rm /usr/bin/vim
ln -s /usr/bin/nvim /usr/bin/vi
ln -s /usr/bin/nvim /usr/bin/vim

