Start-Process -FilePath "wsl" -ArgumentList "-d $s sudo bash -c 'echo `"danlucaci ALL=(ALL) NOPASSWD: ALL`" >> /etc/sudoers'" -NoNewWindow -wait