![Docker compose / autobuild](https://img.shields.io/badge/docker%20compose-autobuild-green)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repo is designed to make it easy for Home Assistant users 
to begin using the Docker platform for their servers. 

## Get started with HA on Docker

<img align="right" src="about/basic-diagram.png">

Here is a basic setup that anyone can use to 
get started with Home Assistant in Docker containers. 
This is not the final configuration, but a jump-off point 
if you want to make the leap to Docker. 
I came from a python venv setup and, 
once I'd ironed out the issues by using these config files, 
I was surprised at how quick and simple it was to do things with Docker. 

This is a really simple Docker compose stack. 
These configs give you a vanilla install, 
but using three separate containers for the classic split 
of web front-end, application layer and database back-end.
From here you can add your own configuraion yaml files on top,
and it works really well as a starting point for a git repository, 
allowing you to come back and rebuild this deployment from scratch very quickly.


## Quick start with docker

You will find full step-by-step instructions at 
https://github.com/artmg/MuGammaPi/wiki/Home-Assistant-Docker for installing:

* Ubuntu Server operating system
* the Docker Engine

Then simply clone this repo

```
cd /srv/docker/config
git clone git@github.com:artmg/home-assistant-docker.git .
```

See also https://community.home-assistant.io/t/absolute-beginners-guide-to-installing-ha-on-intel-nuc-using-docker/98412


## Why use this?

Many people start off on a hobbyist device like a Raspberry Pi 
and then realise that they want more reliability or power. 
When moving to a 'NUC' mini-pc, or an old PC they have available 
they realise that their device can cope with more services 
and Docker is a common deployment method that allows diversity 
in a single physical box. 

This repo is intended as a stepping stone, to help users 
new to Docker to migrate their configurations into a working 
environment as easily as possible. 

### What else can I do?

If you want to try this out, simply clone the repo to your device. 

If you want to use it to transform your config onto a Docker platform, then fork it to your own repo and begin adding your own code. 

Note that forked repos are public by default. You should consider either making your fork private, or at least being careful with the details of your own environment that you make public.

## Documentation To Do

### User notes

* Move the docker instructions into an `instructions` subfolder here
* If you started with a clone, and already added your own config, how to turn the modified clone into your own repo - https://github.com/artmg/lubuild/blob/master/help/use/git-source-control.md#workflow-examples
* Data Notes (linked from compose/README)
* 

### developer notes

how to manage this repo in a way that makes it easy for forks to:
* merge changes into their own forked codebase
* submit PRs

