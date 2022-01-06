FROM alpine:3.15

RUN apk add --no-cache \
  ca-certificates

# Caddy

RUN apk add --no-cache caddy \
 && adduser -D -g 'www' www \
 && mkdir -p /www \
 && chown -R www:www /www

COPY Caddyfile /etc

# PHP

RUN apk add --no-cache \
      curl \
      font-noto \
      php7-fpm \
      php7-json \
      rrdtool

RUN sed -e "s|listen\s*=\s*.*|listen = 0.0.0.0:9000|g" \
        -e "s|;access\.log.*|access.log = /dev/stdout|g" \
        -i /etc/php7/php-fpm.d/www.conf

RUN sed -i "s|;error_log = syslog|error_log = /dev/stderr|g" /etc/php7/php.ini

# Collectd Graph Panel

ARG CGP_COMMIT=5daa8b3a98818e7bbedf8e0e2a27a4672ee6dfdd

ENV INSTALL_PATH /www
RUN curl -L https://github.com/pommi/CGP/archive/$CGP_COMMIT.tar.gz \
      | tar -C $INSTALL_PATH --strip-components=1 -xzf - \
 && chown -R root:root $INSTALL_PATH \
 && chmod -R 555 $INSTALL_PATH

COPY entrypoint.sh /

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
