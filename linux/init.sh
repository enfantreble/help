echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo apt update
sudo apt upgrade
sudo apt install dos2unix
dos2unix /mnt/c/Code/help/linux/apt.list
cat /mnt/c/Code/help/linux/apt.list | xargs sudo apt install -y

touch ~/.bash_aliases
echo "alias vi='nvim'" >> ~/.bash_aliases
echo "alias vim='nvim'" >> ~/.bash_aliases
echo "alias bat='batcat'" >> ~/.bash_aliases
echo "alias fd='fdfind'" >> ~/.bash_aliases


sudo apt install python3-pip
pip

echo 'export PATH=$PATH:/home/danlucaci/.local/bin' >> ~/.bashrc