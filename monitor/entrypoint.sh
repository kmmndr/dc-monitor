#!/bin/sh
set -eu

export MONITOR_PASSWORD="$(caddy hash-password -algorithm scrypt -plaintext $MONITOR_PASSWORD)"

goreman -exit-on-error -set-ports=false -f /Procfile start
