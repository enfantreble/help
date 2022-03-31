mkdir .ssh/old
mv ~/.ssh/config ~/.ssh/old/config.$(date +%Y%m%d_%H%M%S_%Z)
mv ~/.ssh/authorized_keys ~/.ssh/old/authorized_keys.$(date +%Y%m%d_%H%M%S_%Z)
wget 192.168.1.2/config -O ~/.ssh/config
wget 192.168.1.2/slim.pub -O ~/slim.pub
mv --backup -f ~/slim.pub ~/.ssh/authorized_keys
ftp -n <<EOF
open 192.168.1.2
user ftp
passive
put ~/.ssh/id_ed25519.pub /upload/id_ed25529.`hostname`.pub
EOF
