java -version
wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=openhab' | sudo apt-key add -
echo "deb http://dl.bintray.com/openhab/apt-repo stable main" | sudo tee /etc/apt/sources.list.d/openhab.list
sudo apt-get update
sudo apt-get install openhab-runtime samba apache2 -y
sudo adduser openhab gpio
sudo chown -hR openhab:openhab /etc/openhab
sudo chown -hR openhab:openhab /usr/share/openhab
#sudo apt-get autoremove libjna-java -y
#wget http://ftp.debian.org/debian/pool/main/libj/libjna-java/libjna-java_3.2.7-4_armhf.deb
#sudo dpkg -i libjna-java_3.2.7-4_armhf.deb
sudo apt-get install openhab-addon-binding-gpio -y
sudo cp -R /usr/share/openhab/configurations/addons /etc/openhab/configurations/
sudo cp /etc/openhab/configurations/openhab_default.cfg /etc/openhab/configurations/openhab.cfg
sudo smbpasswd -a openhab
sudo update-rc.d smbd enable
sudo update-rc.d nmbd enable
sudo service smbd restart

