#!/bin/sh

stage=${1:-default}

cat <<EOF
COMPOSE_PROJECT_NAME=monitor
EOF

case $stage in
	'default')
		cat <<-EOF
		MONITOR_LOGIN=admin
		MONITOR_PASSWORD=admin
		EOF
		;;
esac
