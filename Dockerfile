FROM babim/debianbase:9

# Download option
## ubuntu/debian
RUN apt-get update && \
    apt-get install -y gnupg wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh && apt-get purge -y wget
    
RUN apt-get update && \
    apt-get install curl apt-transport-https -y --force-yes && \
    curl -L https://packagecloud.io/varnishcache/varnish60/gpgkey | apt-key add - && \
    echo "deb https://packagecloud.io/varnishcache/varnish60/debian/ stretch main"\
	  >> /etc/apt/sources.list.d/varnish-cache.list && \
    apt-get update && \
    apt-get install varnish -y --force-yes
	
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y --purge && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

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
