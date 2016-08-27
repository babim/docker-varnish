FROM babim/ubuntubase

RUN apt-get update && \
    apt-get install varnish -y --force-yes
	
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove

# Define mountable directories.
VOLUMES ["/var/lib/varnish", "/etc/varnish"]
RUN mkdir -p /etc-start/varnish && mkdir -p /var-start/lib/varnish && \
    cp -R /etc/varnish/* /etc-start/varnish && \
    cp -R /var/lib/varnish/* /var-start/lib/varnish

EXPOSE 80
ADD start.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
