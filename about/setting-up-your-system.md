This is going to get you through setting up your system as quickly and as easily as possible. You are welcome to do things your own way, but if you're not sure how this will guide you through:

* a very basic install of Ubuntu Server
* getting yourself secure remote control via ssh

If you already have this then you can move straight on to [Install Docker](/about/installing-docker.md)


# Base Operating System


## Initial install

This is using Ubuntu Server LTS as the OS under docker, 
for a combination of efficiency, flexibility and control. 
Choosing Ubuntu gives you good community support, 
and you only need the Server not the Desktop. 

A lot of people use a 'NUC' micro-PC, 
but any kit that runs x86 will do. 
Some people even use a Virtual Machine with **VirtualBox**. 
A Virtual Machine is a great way to develop and test solutions before committing yourself.

* make yourself a live USB installer for Ubuntu Server LTS
	* this is just a pendrive with an image you write to it
	    - or for a virtual machine you just mount the ISO
	* you'll easily find instructions online
	* at the time of writing 18.03.4 LTS was the most recent
	* insert it into the server you want to build
	* yes you WILL loose any data previously on that server 
* Power on the server device
* Press F11 (or DEL or other key) for boot options
* choose to boot from the live installer
* user@hostname
* password
* install **openssh**
* do **NOT** bother with docker snap (buggy config needs too much cleanup)


## Secure Shell access

Once you are up and running, your 'management interfaces' 
will be browser-based, but you need a secure way to connect 
to the operating system console for the initial setup, 
and any future maintenance. 

### SSH config and hardening

A sensible security recommendation is only to allow SSH 
logon using certificates. Generate yourself a certificate
using `ssh-keygen` and upload the public key to the server. 

* e.g. `ssh-keygen -t ed25519`
* Enter to accept the default location. 
* You may choose NOT to enter a passphrase, 
* but then you must keep your keys stored securely. 
* if you need no passphrase then just Enter Enter

* now copy the certificate to the server you have just built
* this first time around you will need to give the user and password from the server installation

`ssh-copy-id -i ~/.ssh/mycertificate.pub user@hostname`

* log on to test that it works

`ssh -i ~/.ssh/mycertificate.pub user@hostname`

* configure the security on the server

```
sudo sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo sed -i "s/.*X11Forwarding.*/X11Forwarding no/g" /etc/ssh/sshd_config
sudo tee -a /etc/ssh/sshd_config <<EOF!
AllowUsers=build
EOF!

sudo systemctl reload ssh.service
sshd -T
```

Now you are all ready to [Install Docker](/about/installing-docker.md)

## Note

These instructions were derived from https://github.com/artmg/MuGammaPi/wiki/Home-Assistant-Docker - check there if something does not work out. See also https://community.home-assistant.io/t/absolute-beginners-guide-to-installing-ha-on-intel-nuc-using-docker/98412

