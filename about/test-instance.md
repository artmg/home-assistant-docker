Sometimes its good to be able to try out new configurations or integrations, 
but without trashing your real Home Assistant instance.

The safest way to do this is an entirely separate instance of everything, 
which you could do on a separate piece of hardware, or for simplicity 
you can run on a virtual machine. 

However either of these require additional computer resources, 
and so the most economical way of testing would be to reuse 
most of your existing components, simply running a separate 
container for your test Home Assistant. 

This is the kind of separation that Docker was made for, 
and is definitely the most efficient on resources, 
but you just need to be slightly more cautious as you are 
working very close to your live environment. 


## Separate Docker Instance in VM

You can create an easily accessible, always available, 
entirely separate system to do whatever kind of test you want 
by creating a Virtual Machine in your regular PC, 
or whatever device you prefer.

* Download the ISO for Ubuntu Server, Manual Installation for LTS version maybe
* Install VirtualBox
* Create a new Virtual Machine
* Allocate 1 GB RAM and 25 GB disk size
	* don't skimp on disk, your vdi file is compressed and automatically expands only as needed. If you don't put enough now, it's a lot of effort to expand later
* follow the instructions in [setting-up-your-system](setting-up-your-system.md)
* then [installing-docker](installing-docker.md)
* and finally deploy this project by following the [README](../README.md)
* restart the VM so all the latest components are running
* You might like to take a snapshot of the VM now, so that you can easily revert


## Inside Docker instance

_**Work in progress**_

If you want a sister-instance of Home Assistant, 
but with a minimal footprint, you could
reuse the same instances of:

* Docker Engine
* Portainer - simply manages the docker environment
* SQL DB server is neutral to HA, just use a different DB

We could use the same nginx in theory, 
but you might have some clever config, 
so we'll work out whether a separate instance is simpler or not.

Assuming you want you own separate compose stack for test instances, 
they will need to share the appdb network, 
so you want to create that as an overlay network

```
docker network create -driver overlay --attachable public
```

* Create test folder
* copy the HAD template hass into it
* copy the HAD template docker/compose into it
* rename as compose-test
* comment out postdb section 
* replace networks/appdb subsection with...

```
networks:
  appdb:
    external:
      name: appdb
```

or

```
networks:
  appdb:
    external: true
    name: appdb
```

* switch nginx ports to `8080:80` and `8443:443`
* rename network webapp to webapp-test
* rename volume /hass to /test/hass
* copy freshen-containters.sh to test/freshen-test.sh and change folder to cd compose-test
* 
