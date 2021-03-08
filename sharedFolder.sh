sudo groupadd eng
sudo useradd -g eng deploy
sudo mkdir -p /home/eng
sudo chgrp -R eng /home/eng
sudo chmod -R 2775 /home/eng
for ID in $(cat /etc/passwd | grep /home | cut -d ':' -f1); \
do (adduser $ID eng; ln -s /home/eng /home/$ID);done
