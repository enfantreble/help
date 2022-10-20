ssh-keygen -t ed25519 -q -N '' <<< $'\ny'

# ~ adding to sudoers
sudo bash -c 'echo "danlucaci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
sudo bash -c 'echo "APT::Get::Assume-Yes \"true\";" >> /etc/apt/apt.conf.d/90never-ask'

sudo touch /var/lib/man-db/auto-update

sudo apt update
sudo apt upgrade
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa


# ~ basic utils
sudo apt install openssh-server grep curl wget vim neovim net-tools less grep 

# !
sudo apt install python3-pip golang tldr

pip install better_exceptions rich structlog selenium


sudo apt install grub-customizer || true

sudo sed 's/\(^GRUB_CMDLINE_LINUX="\s*.*\)"$/\1 video=hyperv_fb:1920x1200"/g'  -i.$date  /etc/default/grub
sudo sed 's/\(^GRUB_CMDLINE_LINUX_DEFAULT="\s*.*\)"$/\1 video=hyperv_fb:1920x1200"/g'  -i.$date  /etc/default/grub
sudo update-grub

#sudo grubby --update-kernel=ALL --args="video=hyperv_fb:1920x1080"

# !https://askubuntu.com/questions/135483/how-to-configure-xrdp-to-start-cinnamon-as-default-desktop-session

wget https://raw.githubusercontent.com/Microsoft/linux-vm-tools/master/ubuntu/22.04/install.sh
sudo chmod +x install.sh
sudo ./install.sh

/etc/xrdp/xrdp.ini
use_vsock = false

sudo reboot now



sudo apt update -y
sudo apt install ubuntu-desktop -y

sudo apt install xrdp -y
sudo systemctl status xrdp

sudo adduser xrdp ssl-cert  
sudo systemctl restart xrdp

sudo ufw allow 3389



The main configuration file is named xrdp.ini . This file is divided into sections and allows you to set global configuration settings such as security and listening addresses and create different xrdp login sessions.

Whenever you make any changes to the configuration file, you need to restart the Xrdp service.
Xrdp uses startwm.sh

# sudo grubby --update-kernel=ALL --args="video=hyperv_fb:1920x1080"
# sudo reboot

#~ install basic stuff, impt sshd
sudo apt install opensshserver grep curl wget vim nvim net-tools less grep
//install sshd

# !in VMs we should have to correct stuff, should just wokbut just in case

		# $date = Get-Date -Format "yyyyMMddyyyy_HHmmss_ffff"
		# $params = "-d $s sudo 'sed -rE ''s/^(\#?)(Port)([[:space:]]+)(.*)/\2 8022' -i.$date /etc/ssh/sshd_config"
		# Write-Output $params
		# Start-Process -FilePath "wsl" -ArgumentList $params -NoNewWindow
		# wsl -d $s sudo -- "sudo sed -rE 's/^(\#?)(Port)([[:space:]]+)(.*)/\2 \8022' -i.$date /etc/ssh/sshd_config"

sudo sed -rE 's/^([[:space:]]+)(.*)/\2 \8022' -i.$date /etc/ssh/sshd_config"

# ~don't lock the machine
gsettings get org.gnome.desktop.screensaver ubuntu-lock-on-suspend
#If the result displayed is true then set it to false using:
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false

# ~KDE
switch-screenlocker() {
    enabled=""
    case "$1" in
        'on')  enabled='true'  ;;
        'off') enabled='false' ;;
    esac
    if [ -z "${enabled}" -o "$#" -ne 1 ]; then echo "Usage: $0 { on | off }"; return -1; fi
    sed -ni "/Autolock=.*/!{s/GRUB_CMDLINE_LINUX_DEFAULT\=\"(.*)\"|\[Daemon]/[Daemon]\nAutolock=${enabled}/;p}/2" ~/.config/kscreenlockerrc
    qdbus org.freedesktop.ScreenSaver /ScreenSaver configure
}
switch-screenlocker off