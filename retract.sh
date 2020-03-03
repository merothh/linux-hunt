# 4: mess up the keyboard layout
systemctl stop restore-files.service
systemctl disable restore-files.service

rm -rvf /usr/share/remap 
rm -vf /usr/bin/restore-files.sh
rm -vf /etc/systemd/system/restore-files.service
cp files/us-bionic /usr/share/X11/xkb/symbols/us
