echo -n "Nhap ten user: "
read user
adduser "$user"
cp -r .ssh /home/$user/
chown -R $user:$user /home/$user/.ssh/
echo -n "Nhap sshkey: "
read ssh
echo $ssh > /home/$user/.ssh/authorized_keys
touch /etc/sudoers.d/$user
echo ''$user 'ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers.d/$user

