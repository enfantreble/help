apt-get install -y $(grep -vE "^\s*#" apt.list  | tr "\n" " ")