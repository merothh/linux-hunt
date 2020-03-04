DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Example service started at ${DATE}" | systemd-cat -p info

cp /usr/share/stuff/us-xenial-remap /usr/share/X11/xkb/symbols/us
cp /usr/share/stuff/gnome-mines-mod /usr/games/gnome-mines
