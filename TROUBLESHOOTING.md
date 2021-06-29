# Troubleshooting

## Basics

```
### Check your versions
lsb_release -a && uname -a && docker --version && docker-compose --version

docker ps
docker images
docker network ls

docker info

systemctl status docker.service

# check you are a member of the docker group
groups | grep docker || groups
# check that hello world runs in user context
docker run hello-world
```

### rebuild all containers

```
cd $ROOTDIR
cd config/compose

docker-compose down
docker-compose up -d --build
docker-compose logs
docker-compose ps
```

## Specific Issues

### Portainer failing after reboot

After you reboot the server hosting your docker platform, 
you may find Portainer has issues working properly. 
If it appears to start up, but you get the errors 
`failure object not found inside the database`
and you can find no local endpoints available:

```
docker ps
# find the NAME of the container running portainer
# then stop it
docker stop nameof_container

# use the proper command to run the containter
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
# if you still have issues browse to http://docker-host:9000/#/init/admin
# to reset the portainer environment
```

### Hacking files in the docker image

I was getting an error in the metno weather app, 
and [the workaround](https://github.com/home-assistant/core/issues/36874#issuecomment-645486115) involved a hack to the metno code. 
Unfortunately this was in `/usr/local/lib/python3.7/site-packages` 
so meant having to go inside the docker container.

```
docker cp compose_homeassistant_1:/usr/local/lib/python3.7/site-packages/metno/__init__.py .

sed -i 's/!= 200/not in (200, 203)/' __init__.py

docker cp __init__.py compose_homeassistant_1:/usr/local/lib/python3.7/site-packages/metno/

# more permanent fix
cp __init__.py cfg/docker/compose/

```
