usr_account=students

release=$(sed -rn 's/^VERSION_ID="([^"]*)"/\1/p' /etc/os-release)
if [ "$release" != "16.04" ]; then
	echo "This script is meant to be run on Ubuntu 16.04 systems"
	exit
fi

# 0: prepare
## setup the restoring service
mkdir -p /usr/share/stuff

cp files/restore-files.sh /usr/bin/
chmod +x /usr/bin/restore-files.sh

cp files/restore-files.service /etc/systemd/system/
chmod 644 /etc/systemd/system/restore-files.service

systemctl enable restore-files.service

## install vim | get rid of onscreen keyboard
apt install vim
apt remove onboard

## mess up the keyboard layout
cp files/us-xenial-remap /usr/share/stuff/

# 1: disable splash | show warning in boot screen | hide in grub config ?
sed -i s/"GRUB_CMDLINE_LINUX_DEFAULT=.*"/"GRUB_CMDLINE_LINUX_DEFAULT=\"\""/ /etc/default/grub

echo -e \
"echo clue1 \n" > /usr/bin/clue1

chmod +x /usr/bin/clue1

echo -e \
"[Unit] \n\
Description=clue1 \n\
\n\
[Service] \n\
Type=oneshot \n\
ExecStart=/usr/bin/clue1 \n\
\n\
[Install] \n\
WantedBy=multi-user.target" > /etc/systemd/system/congrats_key:aw3se4dr5_next:vi.service

systemctl enable congrats_key:aw3se4dr5_next:vi.service

update-grub

# 2: show clue when opening vim | hide in vimrc ?
echo "autocmd VimEnter * echo \"Next:FindMe\"" > /home/$usr_account/.vimrc
echo "\"Key:szxdxcfcv_Next:LocateMyNotSoQuietAncestor" >> /home/$usr_account/.vimrc

# 3: copy hestia man page
cp files/hestia.1.gz /usr/share/man/man1/hestia.1.gz

# 4: gnome mines
cp files/gnome-mines-mod /usr/share/stuff/

# 5: ENV variable
echo ". /usr/share/bash-aliases/aliases" > /home/$usr_account/.bash_aliases
mkdir -p /usr/share/bash-aliases
echo "export KEY_LINUX_HUNT=\"12345678990\"" > /usr/share/bash-aliases/aliases
