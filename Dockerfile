FROM babim/alpinebase

## alpine linux
RUN apk add --no-cache wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh && apk del wget
    
RUN apk add --no-cache varnish
	
# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl

ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_IP web
ENV VARNISH_PORT 80
ENV VARNISH_MEMORY 1G

# Define mountable directories.
VOLUME ["/var/lib/varnish", "/etc/varnish"]

RUN mkdir -p /etc-start/varnish && cp -R /etc/varnish/* /etc-start/varnish
    
EXPOSE 80

ADD start.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
