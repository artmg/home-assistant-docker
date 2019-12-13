## you can't ignore... compose

This `compose` configuration folder contains a `.gitignore` 
that hides the following files either because they contain 
details that are specific to an environment 
or because they contain secret credentials. 

## .env

This is the Environment file that docker-compose uses to 
hold environment-specific variables

### Quick start

Assuming you have a $ROOTDIR set up, e.g. 

```
ROOTDIR=/srv/docker
```

* you can create your own using an editor, or by pasting in

```
mkdir -p $ROOTDIR/config/compose/
tee $ROOTDIR/config/compose/.env <<EOF!
PUID=`id -u $USER`
PGID=`getent group docker | cut -d: -f3`
TZ=`cat /etc/timezone`
CONFDIR=$ROOTDIR/config
DATADIR=$ROOTDIR/data
POSTGRES_DB=hass
POSTGRES_USER=homeassistant
POSTGRES_PASSWORD=my3pass7word
# if you have one, use the actual device name e.g.  DEV_USB0=/dev/ttyUSB0
DEV_USB0=/dev/null
DEV_USB1=/dev/null
DEV_ACM0=/dev/null
EOF!
```

This will be enough to get you going. 
See _Notes on Data_ for an explanation of how 

1. most HA data is transient 
2. the db and other elements are automatically created at startup

## Template to edit

If you want to had edit the file yourself using a text editor, 
then here is a template:

```
PUID=UserID you want to run the Docker containers under
PGID=GroupID of the docker group
TZ=Continent/Capital
CONFDIR=location of managed configuration files
DATADIR=location of service data
POSTGRES_DB=databaseName
POSTGRES_USER=databaseUser
POSTGRES_PASSWORD=databasePassword
# if you have one, use the actual device name e.g.  DEV_USB0=/dev/ttyUSB0
DEV_USB0=/dev/null
DEV_USB1=/dev/null
DEV_ACM0=/dev/null
```

## Back up your file

As mentioned, git will ignore this file, 
so if you use a repo to store your config, 
then keep a backup copy of this file somewhere safe. 
