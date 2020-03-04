usr_account=merothh

release=$(sed -rn 's/^VERSION_ID="([^"]*)"/\1/p' /etc/os-release)

# 0: setup the restoring service
mkdir -p /usr/share/stuff

cp files/restore-files.sh /usr/bin/
chmod +x /usr/bin/restore-files.sh

cp files/restore-files.service /etc/systemd/system/
chmod 644 /etc/systemd/system/restore-files.service

systemctl enable restore-files.service

# 1: disable splash | show warning in boot screen | hide in grub config ?
sed -i s/"GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\""/"GRUB_CMDLINE_LINUX_DEFAULT=\"quiet\" #Key:uhbnjiokm_Next:MyPartner"/ /etc/default/grub

echo -e \
"echo clue1 \n\
###Key:000000000_You Have Reached Level X" > /usr/bin/clue1

chmod +x /usr/bin/clue1

echo -e \
"[Unit] \n\
Description=clue1 \n\
\n\
[Service] \n\
Type=oneshot \n\
eExecStart=/usr/bin/clue1 \n\
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

# 5: mess up the keyboard layout
cp files/us-xenial-remap /usr/share/stuff/


