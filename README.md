# Hello and Welcome

**This is a compilation of some random scripts I have made and used in the past; everything here is mine. If something here is not mine, it is posted here with the creator's permission and credited fully.** 

## Best Setup Practices

Before running and modifying the scripts to fit your needs, check to see if UFW is installed and running. Also, be aware these are for UFW firewalls. Scripts for IPTables will be posted elsewhere. 

To check and make sure UFW is installed and running, you can use the following;

`sudo ufw status verbose`

You can also check by using;

`sudo ufw status`

If UFW is already installed and running, make sure to;

`sudo ufw disable`

Also, make sure to clear any existing configurations. Only clear current configurations if you have nothing you would like to keep. You can do this with;

`sudo ufw reset`

If you would like to incorporate this setup process into the scripts, you certainly can; just be aware it could cause some issues if implemented incorrectly. 

If you are continuing, you can either deny or allow incoming and outgoing traffic to the machine. You can do this with;

`sudo ufw default deny incoming`

`sudo ufw default allow incoming`

`sudo ufw default allow outgoing`

`sudo ufw default deny outgoing`

You also want to make sure you whitelist your connection. This step is important if you are using a VPN or an outside address you would not like blocked. You can do these multiple ways, some are;

`sudo ufw allow ssh`

`ufw allow from 0.0.0.0 to any port 22`

Once you are ready, you can run any of the scripts. If you already know what you are doing, this isn't needed. Make sure when you finish, check to see if UFW is running. Yet again;

`sudo ufw status`

`sudo ufw status verbose`

If you find any issues at all, please let me know. If you have any improvements or anything at all, please reach out. Thanks!
