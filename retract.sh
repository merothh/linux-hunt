usr_account=user

# 0: prepare
## kill the restoring service
systemctl disable restore-files.service

rm -rvf /usr/share/stuff
rm -vf /usr/bin/restore-files.sh
rm -vf /etc/systemd/system/restore-files.service

## restore on-screen-keyboard
apt install onboard

# 1: enable splash | kill warnings
sed -i s/"GRUB_CMDLINE_LINUX_DEFAULT=.*"/"GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\""/ /etc/default/grub

systemctl disable congrats_key:aw3se4dr5_next:vi.service

rm /usr/bin/clue1
rm /etc/systemd/system/congrats_key:aw3se4dr5_next:vi.service

update-grub

# 2: kill .vimrc
rm /home/$usr_account/.vimrc

# 3: delete hestia man page
rm /usr/share/man/man1/hestia.1.gz

# 4: reinstall gnome mines
#apt install --reinstall gnome-mines
cp files/gnome-mines /usr/games/

# 5: restore xenial keylayout
cp files/us-xenial /usr/share/X11/xkb/symbols/us
