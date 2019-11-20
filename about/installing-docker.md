
# Installing Docker


## Options


For Ubuntu we install Docker CE (Community Edition)

* The recommended approach is 
	- to set up Docker’s own repositories and install from them. 
	- This is what most users do, for [ease of installation and upgrade](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-engine---community). 
	- it's not that hard
* Alternatively you might 
   - use the 'get.docker.com' _convenience script_ as it is even simpler 
   - but is not normally recommended outside dev and test environments. 
* DO NOT
	- be tempted by the Ubuntu installer to take 'docker snap package' option. 
	- it can be buggy and you may end up spending more time applying fixes


## Preferred way - docker repos


```
# credit https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt-get update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo apt install -y docker-compose
sudo usermod -aG docker $USER

# test
sudo docker run hello-world
```

## Alternative - get.docker.com


```
curl https://get.docker.com | sh
sudo apt install -y docker-compose
sudo usermod -aG docker $USER
sudo docker run hello-world
```

## That's it

Now you are all ready to use this repo - go back to the [README](/README.md)

### Note

These instructions were derived from https://github.com/artmg/MuGammaPi/wiki/Home-Assistant-Docker - check there if something does not work out. See also https://community.home-assistant.io/t/absolute-beginners-guide-to-installing-ha-on-intel-nuc-using-docker/98412

