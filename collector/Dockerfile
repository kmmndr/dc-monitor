FROM alpine:3.15

RUN apk add --no-cache collectd collectd-plugins-all

ADD collectd.conf /etc/collectd/
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/var/lib/collectd"]

ENTRYPOINT ["/entrypoint.sh"]
