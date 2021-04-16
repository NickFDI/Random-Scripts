# Hello and Welcome

**This is a compilation of some random scripts I have made and used in the past, everything here is mine. If something here is not mine then it is posted here with the permission of the creator, and it credited fully.** 

## Best Setup Practices

Before running or modifying any of the scripts to fit your needs make sure to check to see if UFW is installed and running. Also be aware these are for UFW firewalls. 

To check and make sure UFW is installed and running you can use the following;

`sudo ufw status verbose`

You can also check by using;

`sudo ufw status`

If UFW is installed and running make sure to;

`sudo ufw disable`

Also make sure to clear any existing configurations. Only clear existing configurations if you have nothing you would like to keep. This can be done with;

`sudo ufw reset`

Now if you would like to incorporate this set up process into the scripts you certainly can, just be aware it could cause some issues if implemented incorrectly. 

If you are continuing you can either deny or allow incoming and outgoing traffic to the machine. This can be done with;

`sudo ufw default deny incoming`
`sudo ufw default allow incoming`
`sudo ufw default allow outgoing`
`sudo ufw default deny outgoing`

You also want to make sure you whitelist your own connection. This is important if you are using a VPN or outside address you would not like blocked. You can do this multiple ways, some are;

`sudo ufw allow ssh`
`ufw allow from 0.0.0.0 to any port 22`

Once you are ready you can run any of the scripts. If you already know what you are doing this isn't needed. Make sure when you are done to check to see if UFW is running. Yet again;

`sudo ufw status`
`sudo ufw status verbose`

If you find any issues or anything at all please let me know, if you have any improvements or anything at all, please reach out. Thanks!
