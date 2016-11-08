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
RUN mkdir -p /etc-start/varnish && mkdir -p /var-start/lib/varnish && \
    cp -R /etc/varnish/* /etc-start/varnish && \
    cp -R /var/lib/varnish/* /var-start/lib/varnish

EXPOSE 80

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
