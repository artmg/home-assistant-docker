This repo is designed to make it easy for Home Assistant users 
to begin using the Docker platform for their servers. 

## Background

Many people start off on a hobbyist device like a Raspberry Pi 
and then realise that they want more reliability or power. 
When moving to a 'NUC' mini-pc, or an old PC they have available 
they realise that their device can cope with more services 
and Docker is a common deployment method that allows diversity 
in a single physical box. 

This repo is intended as a stepping stone, to help users 
new to Docker to migrate their configurations into a working 
environment as easily as possible. 

If you want to try this out, simply clone the repo to your device. 

If you want to use it to transform your config onto a Docker platform, then fork it to your own repo and begin adding your own code. 

Note that forked repos are public by default. You should consider either making your fork private, or at least being careful with the details of your own environment that you make public.

## Quick start with docker

See https://github.com/artmg/MuGammaPi/wiki/home-assistant-docker for instructions on

* installing docker

Now clone this repo

```
cd /srv/docker/config
git clone git@github.com:artmg/home-assistant-docker.git .
```

https://github.com/artmg/lubuild/blob/master/help/use/git-source-control.md#workflow-examples


## Documentation To Do

### User notes

If you started with a clone, and already added your own config, how to turn the modified clone into your own repo

### developer notes

how to manage this repo in a way that makes it easy for forks to:
* merge changes into their own forked codebase
* submit PRs

