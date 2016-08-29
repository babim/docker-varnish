FROM babim/debianbase

RUN apt-get update && \
    apt-get install curl apt-transport-https -y --force-yes && \
    curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add - && \
    echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1"\
	  >> /etc/apt/sources.list.d/varnish-cache.list && \
    apt-get update && \
    apt-get install varnish -y --force-yes
	
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove

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
