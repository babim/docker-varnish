[![](https://images.microbadger.com/badges/image/babim/varnish.svg)](https://microbadger.com/images/babim/varnish "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/varnish.svg)](https://microbadger.com/images/babim/varnish "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/varnish:4.1.svg)](https://microbadger.com/images/babim/varnish:4.1 "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/varnish:4.1.svg)](https://microbadger.com/images/babim/varnish:4.1 "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/varnish:alpine.svg)](https://microbadger.com/images/babim/varnish:alpine "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/varnish:alpine.svg)](https://microbadger.com/images/babim/varnish:alpine "Get your own version badge on microbadger.com")

# Use the pre built image

The pre built image can be downloaded using docker directly. After that you do not need to use this command again, you will have the image on your machine.
```
$ sudo docker pull babim/varnish
```
# Start the container

The container has all pre requisites set up to run any varnish application. Specify all needed environment variables.
```
$ sudo docker run -i -d -p 80 -e VARNISH_BACKEND_PORT=8080 -e VARNISH_BACKEND_IP=10.10.10.10 babim/varnish
```
# Start the container and keep control

The command above starts the container in deamon mode (-d) and runs in the background. If you want to start it by yourself just to see what happens use this command:
```
$ sudo docker run -i -t -p 80 -e VARNISH_BACKEND_PORT=8080 -e VARNISH_BACKEND_IP=10.10.10.10 babim/varnish bash
```

## value
```
VARNISH_BACKEND_PORT = Your apache port (default 80)
VARNISH_BACKEND_IP = Your apache server IP (default web . You can use name host and link to other container or IP)
VARNISH_DAEMON_OPTS = other run option (default blank)
VARNISH_MEMORY = malloc memory cache (example: 100M or default 1G)
VARNISH_PORT = your varnish port (default 80)
```
## Environment ssh, cron option

#### SSH = SSH service for docker container
#### SSHPASS = password for SSH service
#### CRON = Crontab service for container
#### NFS = NFS client mount for container (need full permission)
#### SYNOLOGY = SYNOLOGY user ID
#### UPGRADE = upgrade OS for container
#### DNS = DNS google, cloudflare for this container
#### FULLOPTION = all option above


```
SSH=false
SSHPASS=root (or you set)

CRON=false
NFS=false
SYNOLOGY=false
UPGRADE=false
WWWUSER=www-data
MYSQLUSER=mysql
FULLOPTION=true
DNS=false
```
