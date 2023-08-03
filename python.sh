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
