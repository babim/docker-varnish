#!/bin/bash
export TERM=xterm

if [ -z "`ls /etc/varnish`" ] 
then
	cp -R /etc-start/varnish/* /etc/varnish
fi

if [ -z "`ls /var/lib/varnish`" ] 
then
	cp -R /var-start/lib/varnish/* /var/lib/varnish
fi

# Convert environment variables in the conf to fixed entries
# http://stackoverflow.com/questions/21056450/how-to-inject-environment-variables-in-varnish-configuration
for name in VARNISH_BACKEND_PORT VARNISH_BACKEND_IP
do
    eval value=\$$name
    sed -i "s|\${${name}}|${value}|g" /etc/varnish/default.vcl
done

VARNISH_DAEMON_OPTS1=${VARNISH_DAEMON_OPTS:-}
# Start varnish and log
varnishd -f /etc/varnish/default.vcl -s malloc,${VARNISH_MEMORY} -a 0.0.0.0:${VARNISH_PORT} ${VARNISH_DAEMON_OPTS1}
varnishlog
