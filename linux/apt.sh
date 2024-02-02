while read -r package; do sudo apt-get install -y "$package"; done < "$1"
