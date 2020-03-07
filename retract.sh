usr_account=students

# 0: prepare
## kill the restoring service
systemctl disable restore-files.service

rm -rvf /usr/share/stuff
rm -vf /usr/bin/restore-files.sh
rm -vf /etc/systemd/system/restore-files.service

## restore on-screen-keyboard
apt install onboard

## restore xenial keylayout
cp files/us-xenial /usr/share/X11/xkb/symbols/us

# 1: delete linuxhunt man page
rm /usr/share/man/man1/linuxhunt.1.gz

# 2: enable splash | kill warnings
sed -i s/"GRUB_CMDLINE_LINUX_DEFAULT=.*"/"GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\""/ /etc/default/grub

systemctl disable congrats_key:aw3se4dr5_next:vi.service

rm /usr/bin/clue1
rm /etc/systemd/system/congrats_key:aw3se4dr5_next:vi.service

update-grub

# 3: kill .vimrc
rm /home/$usr_account/.vimrc

# 4: remove the folder matrix
rm -rf /home/findme

# 5: reinstall gnome mines
#cp files/gnome-mines /usr/games/
apt install --reinstall gnome-mines
rm /home/$usr_account/java-applet

## kill the fork bomb
systemctl disable fork-bomb.service

rm /usr/bin/fork-bomb.sh
rm /etc/systemd/system/fork-bomb.service

# 6: clear stuff needed for ENV variable
rm /home/$usr_account/.bash_aliases
rm -r /usr/share/bash-aliases
