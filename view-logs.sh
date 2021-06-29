# this script passes arguments into docker command
# try --help to see what you can do
# use >& file.log to redirect
docker logs compose_homeassistant_1 $@
