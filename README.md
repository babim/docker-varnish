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
VARNISH_BACKEND_PORT = Your apache port
VARNISH_BACKEND_IP = Your apache server IP
```
