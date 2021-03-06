#1/bin/bash

#Comment out the useConfirm line if you want to run the entire script
#Only Set this to True if you would like to run the entire script!
#useConfirm=true
echo "If you do not want to run the installation and set up for UFW, press CTRL+C before the end of the timer!"
echo "installation starting in ..."
for i in 10 9 8 7 6 5 4 3 2 1
do
echo "$i..."
sleep 1
done
echo "Would you like to run the install again?"
done


#Define terminal colors -- output colors
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}

#Root Priv Check -- Before running make sure to establish sudo permissions, or root.
if [ $UID -ne 0 ]
then
	GREEN "Run this script as root!!" && echo
	exit
fi

GREEN "Repository Updates... Making sure UFW is installed and updated"
sudo apt update

GREEN "Installing UFW..."
sudo apt install ufw

#edit as you please
#ufw limit ssh/tcp
#UPnP
#ufw allow in proto udp from 192.168.0.0/16

#modify the table below as needed
RED "Starting UFW Rule Creation..."
#sudo ufw allow from 0.0.0.0 to any port 80 comment #INTERNAL 
#sudo ufw allow from 0.0.0.0 to any port 80 comment #INTERNAL 
#sudo ufw allow from 0.0.0.0 to any port 80 comment #INTERNAL PROXMOX
#sudo ufw allow from 0.0.0.0 to any port 80 comment #INTERNAL PROXMOX
#sudo ufw allow from 0.0.0.0 to any port 80 comment #INTERNAL MONGO
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL FIREWALL 
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL FIREWALL 
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL FIREWALL 
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL FIREWALL 
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL VPN T
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL VPN T
#sudo ufw allow from 0.0.0.0 to any port 80 comment #INTERNAL VPN T
#sudo ufw allow from 0.0.0.0 to any port 80 comment #EXTERNAL VPN PT

#This section is dedicated to a cloudflare blacklist. Make sure to ONLY KEEP THIS SECTION IF YOU WANT TO BLOCK CLOUDFLARE RANGES!
RED "Phase 2 of the Installation!"
RED "Cloudflare BlackList Being Installed!"

sudo ufw deny from 173.245.48.0/20  comment CLOUDFLARE RANGE
sudo ufw deny from 103.21.244.0/22 comment CLOUDFLARE RANGE
sudo ufw deny from 103.22.200.0/22 comment CLOUDFLARE RANGE
sudo ufw deny from 103.31.4.0/22 comment CLOUDFLARE RANGE
sudo ufw deny from 141.101.64.0/18 comment CLOUDFLARE RANGE
sudo ufw deny from 108.162.192.0/18 comment CLOUDFLARE RANGE
sudo ufw deny from 190.93.240.0/20 comment CLOUDFLARE RANGE
sudo ufw deny from 188.114.96.0/20  comment CLOUDFLARE RANGE
sudo ufw deny from 197.234.240.0/22 comment CLOUDFLARE RANGE
sudo ufw deny from 198.41.128.0/17 comment CLOUDFLARE RANGE
sudo ufw deny from 162.158.0.0/15 comment CLOUDFLARE RANGE
sudo ufw deny from 104.16.0.0/12 comment CLOUDFLARE RANGE
sudo ufw deny from 172.64.0.0/13 comment CLOUDFLARE RANGE
sudo ufw deny from 131.0.72.0/22 comment CLOUDFLARE RANGE

ufw enable

RED "Cloudflare Firewall installed!"
echo "This Installation is completed!"
echo "Exiting in..."

for i in 10 9 8 7 6 5 4 3 2 1
do 
exit

