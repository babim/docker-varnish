FROM babim/alpinebase

RUN apk add --no-cache varnish
	
# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl

ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_IP web
ENV VARNISH_PORT 80
ENV VARNISH_MEMORY 1G

# Define mountable directories.
VOLUME ["/var/lib/varnish", "/etc/varnish"]

EXPOSE 80

ADD start.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
