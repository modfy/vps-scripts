sudo groupadd eng
sudo useradd -m -g eng deploy -s /bin/bash
cd /home/deploy
git clone git@github.com:modfy/vps-scripts.git
sudo mkdir -p /home/eng
sudo chgrp -R eng /home/eng
sudo chmod -R 2775 /home/eng
for ID in $(cat /etc/passwd | grep /home | cut -d ':' -f1); \
do (adduser $ID eng; ln -s /home/eng /home/$ID);done
sh ./init.sh
