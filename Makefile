default: help
include makefiles/*.mk

.PHONY: start
start: docker-compose-build docker-compose-start ##- Start
.PHONY: deploy
deploy: docker-compose-build docker-compose-deploy ##- Deploy (start remotely)
.PHONY: stop
stop: docker-compose-stop ##- Stop

.PHONY: clean
clean: docker-compose-clean ##- Stop and remove volumes

