wget https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz
Extract source files
tar -zxvf Python-3.10.2.tgz
Go into just created directory
cd Python-3.10.2
Run the configuration command
./configure --enable-optimizations
Install any missing dependencies
sudo apt update
sudo apt install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev
Compile Python
sudo make altinstall
cd /usr/bin
Remove the current link. This does not delete your older Python 3 version, it only unlinks it from that command.
sudo rm /usr/bin/python3
Link the version you want to use from now on
sudo ln -s /usr/local/bin/python3.10 python3
Check if everything is as expected. It should now display the version you just installed (3.10.2 for me).

pi@raspberrypi:~ $ python -V
