#!/bin/sh
set -eu

service=${1:-'all'}

echo "Entrypoint (service: '$service')"

case $service in
  'php')
    php-fpm7 -F
    ;;
  'caddy')
    caddy run -config /etc/Caddyfile
    ;;
  'all')
    # TODO: Do not run more than one process in a container
    $0 caddy &
    $0 php
    ;;
  *)
    exec "$@"
    ;;
esac
