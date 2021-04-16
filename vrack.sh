#!/bin/sh
#Installing OpenVPN

#Firewall Reset 
#ufw --force reset

#UFW Traffic Defaults
#ufw default deny incoming

#Creation of Files and Directories based on what you are trying to accomplish.
mkdir -p /etc/nickfdi/scripts
touch /etc/nickfdi/scripts/vrack.sh

#EDIT BELOW STRING ONLY IF YOU KNOW WHAT THE FUNCTION DOES.
#Make sure to populate the check file daily to allow new whitelisted hosts. 
#echo "echo \"\$(curl REPLACE WITH WEB ADDRESS)\" | while IFS= read -r line ; do ufw allow from \$line to any port 80 comment 'REPLACE WITH COMMENT' ; done" >> /etc/nickfdi/scripts/vrack.sh

#This creates a cronjob to check for new addresses
(crontab -l 2>/dev/null; echo "0 8 * * * sh /etc/nickfdi/scripts/vrack.sh") | crontab -
sh /etc/nickfdi/scripts/vrack.sh

#Add DOCKER Rules
#ufw allow in on REPLACE WITH to REPLACE WITH ADDRESS proto tcp comment 'DOCKER'
#ufw allow in on REPLACE WITH to REPLACE WITH ADDRESS proto tcp comment 'DOCKER'
#ufw allow in on REPLACE WITH to REPLACE WITH ADDRESS proto tcp comment 'DOCKER'
#ufw allow in on REPLACE WITH to REPLACE WITH ADDRESS proto tcp comment 'DOCKER'
#ufw allow in on REPLACE WITH to REPLACE WITH ADDRESS proto tcp comment 'DOCKER'

#Allow SSH to any port you would like - I like random ports 
ufw allow 50009 comment 'SSH Access'

#Check for openvpn
if dpkg --get-selections | grep -q "^openvpn[[:space:]]*install$" >/dev/null; then echo "OpenVPN Installed" 
#If OpenVPN is installed, Add appropriate rules
ufw allow in on tun0 to any port 80 comment 'OPENVPN HTTP'; ufw allow in on tun0 to any port 443 comment 'OPENVPN HTTPS'; ufw allow in on tun0 to any port 8080 comment 'OPENVPN DAEMON'; ufw allow in on tun0 to any port 2022 comment 'OPENVPN SFTP'; ufw allow in on tun0 to any port 3306 comment 'OPENVPN MYSQL'; ufw allow 1194 commemt 'OPENVPN LISTENER'; else ufw allow 80 comment 'OPENVPN HTTP'; ufw allow 443 comment 'OPENVPN HTTPS'; ufw allow 8080 comment 'OPENVPN DAEMON'; ufw allow 2022 comment 'OPENVPN SFTP'; fi
  read -p "Are you you VRacked? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then if ifconfig eno2 | sed -n 3p | grep -qs UP; then o2 interface found as VRack"
  ufw allow in on eno2 to any port 80 comment 'VRack HTTP'
  ufw allow in on eno2 to any port 443 comment 'VRack HTTPS'
  ufw allow in on eno2 to any port 8080 comment 'VRack DAEMON'
  ufw allow in on eno2 to any port 2022 comment 'VRack SFTP'
  ufw allow in on eno2 to a-ny port 3306 comment 'VRack MYSQL'
  ufw allow in on eno2 to any port 6379 comment 'VRack REDIS'
  ufw allow in on eno2 to any port 50023 comment 'VRack 50023'
  ufw allow in on eno2 to any port 50024 comment 'VRack 50024'
  ufw allow in on eno2 to any port 50025 comment 'VRack 50025'
  ufw allow in on eno2 to any port 50026 comment 'VRack 50026'
  ufw allow in on eno2 to any port 50027 comment 'VRack 50027'
  ufw allow in on eno2 to any port 50028 comment 'VRack 50028'
  else
     echo eno2 does not exist
  fi
  if ifconfig eno2 | sed -n 3p | grep -qs UP; then
  echo "eth interface found as VRack"
  ufw allow in on eth2 to any port 80 comment 'VRack HTTP'
  ufw allow in on eth2 to any port 443 comment 'VRack HTTPS'
  ufw allow in on eth2 to any port 8080 comment 'VRack DAEMON'
  ufw allow in on eth2 to any port 2022 comment 'VRack SFTP'
  ufw allow in on eth2 to any port 3306 comment 'VRack MYSQL'
  ufw allow in on eth2 to any port 6379 comment 'VRack REDIS'
  ufw allow in on eth2 to any port 50023 comment 'VRack 50023'
  ufw allow in on eth2 to any port 50024 comment 'VRack 50024'
  ufw allow in on eth2 to any port 50025 comment 'VRack 50025'
  ufw allow in on eth2 to any port 50026 comment 'VRack 50026'
  fi
fi
