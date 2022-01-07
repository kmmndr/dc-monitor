FROM alpine:3.15

RUN apk add --no-cache collectd collectd-plugins-all py3-pip

ENV DOCKER_COLLECTD_PLUGIN_PATH /usr/share/collectd/docker-collectd-plugin

RUN echo 1
# && wget https://github.com/kmmndr/docker-collectd-plugin/archive/refs/heads/python3.tar.gz -O - \
# && wget https://github.com/lebauce/docker-collectd-plugin/archive/refs/heads/master.tar.gz -O - \
RUN mkdir $DOCKER_COLLECTD_PLUGIN_PATH \
 && wget https://github.com/kmmndr/docker-collectd-plugin/archive/refs/heads/python3.tar.gz -O - \
    | tar -C $DOCKER_COLLECTD_PLUGIN_PATH -xvz --strip-components=1 -f -

RUN cd $DOCKER_COLLECTD_PLUGIN_PATH && pip install -r requirements.txt

ADD collectd.conf /etc/collectd/
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/var/lib/collectd"]

ENTRYPOINT ["/entrypoint.sh"]

