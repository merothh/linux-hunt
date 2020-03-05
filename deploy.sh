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

# 1: copy linuxhunt man page
cp files/linuxhunt.1.gz /usr/share/man/man1/

# 2: disable splash | show warning in boot screen | hide in grub config ?
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
WantedBy=multi-user.target" > /etc/systemd/system/a3s5a:and_his_name_was_bram_moolenaar.service

systemctl enable a3s5a:and_his_name_was_bram_moolenaar.service

update-grub

# 3: show clue when opening vim | hide in vimrc ?
echo "autocmd VimEnter * echo \"i have been customized. findme\"" > /home/$usr_account/.vimrc
echo "\"sz4d4:LocateMyNotSoQuietAncestor" >> /home/$usr_account/.vimrc

# 4: make a ton of folders | keep key/clue in only one folder | fill rest with program to shutdown
mkdir -p /home/findme/findme

for count in {1..5000}
do
        mkdir -p /home/findme/findme$count
        cp files/run_me.out /home/findme/findme$count/
done
cp files/run_me-key.out /home/findme/findme3428/run_me.out

# 5: gnome mines
#sed -i "s#https://wiki.gnome.org/Apps/Mines#file:///home/students/java-applet#" gnome-mines
cp files/gnome-mines-mod /usr/share/stuff/

# 6: ENV variable
echo ". /usr/share/bash-aliases/aliases" > /home/$usr_account/.bash_aliases
mkdir -p /usr/share/bash-aliases
echo "export KEY_LINUX_HUNT=\"12345678990\"" > /usr/share/bash-aliases/aliases
