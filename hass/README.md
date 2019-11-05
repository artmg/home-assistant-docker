This `hass` configuration folder contains a `.gitignore` 
that hides the following files either because they contain 
details that are specific to an environment 
or because they contain secret credentials. 

## secrets.yaml

This is the Home Assistant configuration file that keeps private elements out of files that might be posted publicly, e.g. for troubleshooting

### Quick start

Assuming you have a $ROOTDIR set up, e.g. 

```
ROOTDIR=/srv/docker
```

you can create your own using an editor, or by pasting in

```
POSTGRES_DB=hass
POSTGRES_USER=homeassistant
POSTGRES_PASSWORD=my3pass7word
tee $ROOTDIR/config/hass/secrets.yaml << EOF!
db_url: postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postdb/${POSTGRES_DB}
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
db_url: postgresql://homeassistant:my3pass7word@postdb/hass
```

## Back up your file

As mentioned, git will ignore this file, 
so if you use a repo to store your config, 
then keep a backup copy of this file somewhere safe. 
