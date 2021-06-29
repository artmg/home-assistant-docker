
# Portainer - container management interface

Docker works well through the command line, 
but sometimes it's nice just to have a visual overview of 
what is going on, and the ability to click through 
parts of your operational stack. 

Portainer is a simple and effective way of doing this, 
and it's lightweight implementation is suited to smaller environments. 

## Getting started

`docker/portainer/compose.sh`

running this script will bring the Portainer machine up. 
After this it will also come up every time you restart the server. 

To view the interface browse to http://server:9000

## .env file

This folder already contains a `.env` file
rather than asking you to build one
like other parts of this project.
This is for simplicity, as it only needs a single value,
which you can change to any location as you may need. 

## troubleshooting

If the browser interface gives you errors first time you bring it up, you could try bringing the compose **down** then **up** again, or simply restarting the server that hosts docker.

Most of the data in your Portainer instance is gathered automatically from the local docker environment. 
If portainer starts playing up or gets corrupted, you can simply wipe it clean by:

* bringing it down
* removing the data files from the location mentioned in `.env`
* bringing it back up again
* browsing to the initialisation url: `http://server:9000/#/init/admin` 
