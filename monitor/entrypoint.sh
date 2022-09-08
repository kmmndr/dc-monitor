#!/bin/sh
set -eu


goreman -exit-on-error -set-ports=false -f /Procfile start
